import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:nutriya/repository/ApiService/api_service_barrel.dart';

class IsolateRequestModel {
  final Dio networkClient;
  final SendPort requestPort;
  final String requestUrl;
  FormData? requestFormData;
  final Map<String, dynamic> header;
  Map<String, dynamic>? queryParameters;
  Map<String, dynamic>? body;
  final RequestType requestType;

  IsolateRequestModel(
      {required this.networkClient,
      required this.requestPort,
      required this.requestUrl,
      required this.header,
      this.requestFormData,
      required this.requestType,
      this.body,
      this.queryParameters});
}

// required String url,
//       Map<String, dynamic>? queryParameters,
//       Map<String, dynamic>? body,
//       required RequestType requestType
