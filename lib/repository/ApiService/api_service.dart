import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart';
import 'package:nutriya/model/NetworkResponse/network_response.dart';

import '../../Injector/app_injector.dart';
import '../../utils/ImageManager/image_manager.dart';
import '../../utils/ImageManager/media_model.dart';
import '../../utils/LocalData/local_data_manager.dart';
import 'isolate_model.dart';


// Reference https://medium.com/@sandeep.jan19/generic-network-layer-in-flutter-with-dio-fe2202d9643d
enum RequestType { GET, POST, PUT, PATCH, DELETE, FORMDATA, UPLOADFILE }

Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  // 'Auth-key': 'familyrestapi',
  'x-api-key': 'kintreerestapi'
};

class ApiService {
  final dio = createDio();

  ApiService._internal();

  static final _singleton = ApiService._internal();

  factory ApiService() => _singleton;

  static Dio createDio() {
    var dio = Dio();
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          // Do stuff here
          print("**********Dio Error**********\n$error");
          handler.reject(
              error); // Added this line to let error propagate outside the interceptor
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        logPrint: (o) => debugPrint(o.toString()),
      ),
    );

    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 6, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3),
        Duration(seconds: 5),
        Duration(seconds: 8),
        Duration(seconds: 10)
        // wait 3 sec before third retry
      ],
    ));

    return dio;
  }

  /// use QueryParameter for get request
  ///
  /// And body for post request
  Future<NetworkResponse?> apiCall(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      FormData?
          requestFormData, // you can use this if you want to send custom from data without generating it from the body property
      required RequestType requestType}) async {
    // log("body is $body");
//  'Auth-Token': getIt<LocalDataManager>().userToken
    print(" early From api_service ${getIt<LocalDataManager>().userToken}");

    if (getIt<LocalDataManager>().userToken.isNotEmpty) {
      // header["Auth-Token"] = getIt<LocalDataManager>().userToken;
      header["Authorization"] = "Bearer ${getIt<LocalDataManager>().userToken}";
    }

    print(" From api_service ${getIt<LocalDataManager>().userToken}");
    print(" From api_service $url");
    print(" From api_service ${getIt<LocalDataManager>().userId}");

    NetworkResponse? response = await createRequest(
        url: url,
        requestType: requestType,
        queryParameters: queryParameters,
        body: body);
    print("GGG${response?.data}");

    return response;
  }

  Future<NetworkResponse?> createRequest(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      FormData? requestFormData,
      required RequestType requestType}) async {
    NetworkResponse? result;
    String requestUrl = "AppEnvironment.baseUrl" + url;
    ReceivePort port = ReceivePort();
    IsolateRequestModel requestData = IsolateRequestModel(
      networkClient: dio,
      requestPort: port.sendPort,
      requestUrl: requestUrl,
      header: header,
      requestFormData: requestFormData,
      requestType: requestType,
      queryParameters: queryParameters,
      body: body,
    );
    await Isolate.spawn(makeIsolate, requestData);

    result = await port.first;
    return result;
  }

  bool isVideoFile(String filePath) {
    final file = File(filePath);
    final fileExtension = file.path.split('.').last.toLowerCase();

    return (fileExtension == 'mp4' ||
        fileExtension == 'mov' ||
        fileExtension == 'avi');
  }

  Future<List<MultipartFile>> getMultipartListFromFiles(
      {required List<CustomMediaModel> file}) async {
    List<MultipartFile> files = [];
    List<Future<void>> compressionFutures =
        []; // Store compression futures here

    for (CustomMediaModel i in file) {
      if (!isVideoFile(i.filePath ?? "") && (i.imageLink?.isEmpty ?? false)) {
        File assetFile = File(i.filePath ?? "");
        print("Original file size: ${assetFile.lengthSync()} bytes");
        if (assetFile.existsSync()) {
          compressionFutures.add(Future(() async {
            XFile? compressImage = await getIt<ImagePickerManager>()
                .compressAndGetImageFile(assetFile);
            if (compressImage != null) {
              log("got the compressed file ready to add");
              var fileSize = await compressImage.length();
              print('Compressed image file size: $fileSize bytes');
              files.add(await MultipartFile.fromFile(compressImage.path,
                  filename: "${DateTime.now().toIso8601String()}.jpg",
                  contentType: MediaType('image', 'jpeg')));

              log("file add ${files.length}");
            }
          }));
        }
      } else if (isVideoFile(i.filePath ?? "") &&
          (i.imageLink?.isEmpty ?? false)) {
        File assetFile = File(i.filePath ?? "");
        if ((i.filePath ?? "").isNotEmpty) {
          // Compress video (sequentially now)
          File? compressedVideo = await getIt<ImagePickerManager>()
              .compressAndGetVideoFile(assetFile);

          if (compressedVideo != null) {
            files.add(await MultipartFile.fromFile(compressedVideo.path,
                filename: "${DateTime.now().toIso8601String()}.mp4",
                contentType: MediaType('video', 'mp4')));
          }
        }
        // if (assetFile.existsSync()) {
        //   compressionFutures.add(Future(() async {
        //     File? compressVideo = await getIt<ImagePickerManager>()
        //         .compressAndGetVideoFile(assetFile);
        //     // .compresAndGetVideoFile(sourcePath: assetFile.path);
        //     if (compressVideo != null) {
        //       files.add(await MultipartFile.fromFile(compressVideo.path,
        //           filename: "${DateTime.now().toIso8601String()}.mp4",
        //           contentType: MediaType('video', 'mp4')));
        //     }
        //   }));
        // }
      }
    }

    // Wait for all compressions to finish
    await Future.wait(compressionFutures);
    return files;
  }

  // Future<List<MultipartFile>> getMultipartListFromFiles(
  //     {required List<CustomMediaModel> file}) async {
  //   List<MultipartFile> files = [];
  //   for (CustomMediaModel i in file) {
  //     if (!isVideoFile(i.filePath ?? "") && (i.imageLink?.isEmpty ?? false)) {
  //       File? assetFile = await File(i.filePath ?? "");
  //       if ((i.filePath ?? "").isNotEmpty) {
  //         XFile? compressImage = await getIt<ImagePickerManager>()
  //             .compressAndGetImageFile(assetFile);
  //         files.add(
  //           await MultipartFile.fromFile(compressImage?.path ?? "",
  //               filename: "${DateTime.now().toIso8601String()}.jpg",
  //               contentType: MediaType('image', 'jpeg')),
  //         );
  //       }
  //     } else if (isVideoFile(i.filePath ?? "") &&
  //         (i.imageLink?.isEmpty ?? false)) {
  //       File? assetFile = await File(i.filePath ?? "");
  //       if ((i.filePath ?? "").isNotEmpty) {
  //         File? compressVideo = await getIt<ImagePickerManager>()
  //             .compresAndGetVideoFile(sourcePath: assetFile.path);
  //         files.add(await MultipartFile.fromFile(compressVideo?.path ?? "",
  //             filename: "${DateTime.now().toIso8601String()}.mp4",
  //             contentType: MediaType('video', 'mp4')));
  //       }
  //     }
  //   }
  //   return files;
  // }
}

void makeIsolate(IsolateRequestModel requestModel) async {
  Response? result;
  Dio dio = requestModel.networkClient;
  String requestUrl = requestModel.requestUrl;
  Map<String, dynamic> header = requestModel.header;
  Map<String, dynamic>? queryParameters = requestModel.queryParameters;
  Map<String, dynamic>? body = requestModel.body;
  FormData? requestFormData = requestModel.requestFormData;
  try {
    switch (requestModel.requestType) {
      case RequestType.GET:
        {
          print(requestModel);

          Options options = Options(headers: header);
          result = await dio.get(requestUrl,
              queryParameters: queryParameters, options: options);
          print(result.requestOptions.uri.toString());
          print(result.data);
          break;
        }
      case RequestType.POST:
        {
          Options options = Options(headers: header);
          result = await dio.post(requestUrl, data: body, options: options);
          break;
        }
      case RequestType.DELETE:
        {
          Options options = Options(headers: header);
          result = await dio.delete(requestUrl,
              data: queryParameters, options: options);
          break;
        }
      case RequestType.FORMDATA:
        {
          Options options = Options(headers: header);
          result = await dio.post(requestUrl,
              data: requestFormData ?? FormData.fromMap(body ?? {}),
              options: options);
          break;
        }
      case RequestType.PUT:
        {
          Options options = Options(headers: header);
          debugPrint("this is body $body");
          result =
              await dio.put(requestUrl, data: (body ?? {}), options: options);
          break;
        }
      case RequestType.PATCH:
        {
          Options options = Options(headers: header);
          result = await dio.patch(requestUrl, data: body, options: options);
          break;
        }

      default:
        {}
    }
    if (result != null) {
      Isolate.exit(
          requestModel.requestPort, NetworkResponse.success(data: result.data));
    } else {
      Isolate.exit(requestModel.requestPort,
          NetworkResponse.error(message: "Unable to Parse"));
    }
  } on DioException catch (error) {
    Isolate.exit(requestModel.requestPort,
        NetworkResponse.error(message: error.message));
  } catch (error) {
    Isolate.exit(requestModel.requestPort,
        NetworkResponse.error(message: error.toString()));
  }
}
