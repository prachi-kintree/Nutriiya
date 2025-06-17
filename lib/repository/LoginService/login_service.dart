import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


import '../../utils/crypto/crypto_services.dart';

class LoginService {
  // Future<RegisterModel?> checkUserExist({required String contact}) async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiVerifyUserExist,
  //         requestType: RequestType.FORMDATA,
  //         body: {"contact": contact});
  //     if (response != null) {
  //       RegisterModel userData = RegisterModel.fromJson(response.data!);
  //       if (userData.status == 200) {
  //         return userData;
  //       } else {
  //         return null;
  //       }
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //
  // Future<bool?> sendOtpNew(
  //     {required String contactType,
  //     required String contact,
  //     required Function(bool) callBank}) async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiSendOtp,
  //         requestType: RequestType.FORMDATA,
  //         body: {contactType: contact});
  //     if (response != null) {
  //       OtpSentResponse data = OtpSentResponse.fromJson(response.data!);
  //       if (data.code == 201) {
  //         callBank(true);
  //         return data.status;
  //       } else {
  //         callBank(false);
  //         return null;
  //       }
  //     } else {
  //       callBank(false);
  //       return null;
  //     }
  //   } catch (e) {
  //     callBank(false);
  //     return null;
  //   }
  // }
  //
  // Future<bool?> sendOtpToIndianUser(
  //     {required String contact,
  //     required String contactType,
  //     required Function(bool) callBank}) async {
  //   try {
  //     NetworkResponse? response = await ApiService()
  //         .apiCall(url: apiSendOtp, requestType: RequestType.FORMDATA, body: {
  //       contactType: "+91$contact",
  //       // "countryCode": "91"
  //     });
  //     if (response != null) {
  //       OtpSentResponse userData = OtpSentResponse.fromJson(response.data!);
  //       if (userData.status) {
  //         callBank(true);
  //         return userData.status;
  //       } else {
  //         callBank(false);
  //         return null;
  //       }
  //     } else {
  //       callBank(false);
  //       return null;
  //     }
  //   } catch (e) {
  //
  //     callBank(false);
  //     return null;
  //   }
  // }
  //
  // Future<Map<String, dynamic>> validateEmailOtp(
  //     {required String contact,
  //     required String otp,
  //     required String contactType,
  //     bool isForgetPassword = false}) async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: "$apiVerifyEmailOtp" +
  //             "${isForgetPassword ? "username" : "password"}",
  //         requestType: RequestType.FORMDATA,
  //         body: {
  //           contactType: contactType == "phone_no" ? '+91$contact' : contact,
  //           "otp": otp,
  //           //  "type": "1"
  //         });
  //
  //     if (response != null) {
  //       Map<String, dynamic> data = response.data ?? {};
  //       int responseCode = (data["status_code"]);
  //       if (responseCode == 200) {
  //         print('**************hellow**************');
  //         debugPrint(response.data.toString());
  //         ValidateOtpUsernameModel usernameModel =
  //             ValidateOtpUsernameModel.fromJson(data);
  //         if (usernameModel.data?.token != null) {
  //           print("Set from login_service");
  //
  //           getIt<LocalDataManager>().setUserToken(usernameModel.data!.token!);
  //         }
  //
  //         return {"isValid": true, "usermodel": usernameModel};
  //         // return true;
  //       } else {
  //         print('hellow**************');
  //         return {"isValid": false, "usermodel": null};
  //         // return false;
  //       }
  //     } else {
  //       print('**************hellow**************fnnekfnekne');
  //       // Parsing Failed
  //       // return false;
  //       return {"isValid": false, "usermodel": null};
  //     }
  //   } catch (e) {
  //     print('**************hellow**************fnnekfnekne$e***********');
  //     // return false;
  //     return {"isValid": false, "usermodel": null};
  //   }
  // }
  //
  // Future<RegisterModelNew?> validateOtpNew(
  //     {required String contact,
  //     required String contactType,
  //     required String otp,
  //     bool isForgetPassword = false}) async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiVerifyOtp,
  //         requestType: RequestType.FORMDATA,
  //         body: {contactType: contact, "otp": otp});
  //     if (response != null) {
  //       print("Resss ${response.data}");
  //       RegisterModelNew userRegister =
  //           RegisterModelNew.fromJson(response.data!);
  //       print(
  //           "USer registered -  ${userRegister.data?.isRegistrationComplete}");
  //       return userRegister;
  //     } else {
  //       // Parsing Failed
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Exception $e");
  //     return null;
  //   }
  // }
  //
  // Future<RegisterModelNew?> validateEmailOtpforIndianUser(
  //     {required String contact,
  //     required String otp,
  //     required String contactType,
  //     bool isForgetPassword = false}) async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiVerifyOtp,
  //         requestType: RequestType.FORMDATA,
  //         body: isForgetPassword
  //             ? {
  //                 contactType: contact,
  //                 "otp": otp,
  //                 // "type": "1",
  //                 // "countryCode": "91"
  //               }
  //             : {
  //                 contactType: contact, "otp": otp,
  //                 // "countryCode": "91"
  //               });
  //     if (response != null) {
  //       Map<String, dynamic> data = response.data ?? {};
  //       int responseCode = (data["status_code"]);
  //       if (responseCode == 200) {
  //         // return true;
  //         RegisterModelNew userRegister =
  //             RegisterModelNew.fromJson(response.data!);
  //         return userRegister;
  //       } else {
  //         // return false;
  //         return null;
  //       }
  //     } else {
  //       // Parsing Failed
  //       // return false;
  //       return null;
  //     }
  //   } catch (e) {
  //     // return false;
  //     return null;
  //   }
  // }
  //
  // Future<ForgetUserDetailsModel2?> forgetPassword(
  //     {required String contact,
  //     required bool isForUserName,
  //     required String contactType}) async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         // url: "$apiForgetPassword ${isForUserName ? "username" : "password"}",
  //         url: "$apiForgetPassword" +
  //             "${isForUserName ? "username" : "password"}",
  //         requestType: RequestType.FORMDATA,
  //         body: {
  //           contactType: contactType == "phone_no" ? "+91$contact" : contact,
  //           // "type": isForUserName ? "FORGOT_USERNAME" : "FORGOT_PASSWORD"
  //         });
  //     log("this is response ${response?.data}");
  //     if (response?.data != null) {
  //       ForgetUserDetailsModel2 userDetails =
  //           ForgetUserDetailsModel2.fromJson(response?.data ?? {});
  //       return userDetails;
  //     } else {
  //       print('hellow**************');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('**************hellow**************');
  //
  //     return null;
  //   }
  // }
  //
  // Future<ExistingUserLoginModel?> getAuthTokenForExistingUser(
  //     {required String userName}) async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiGetAuthTokenForLoginUser,
  //         requestType: RequestType.FORMDATA,
  //         body: {
  //           "username": userName,
  //           "deviceType": "1",
  //           "userlang": "en",
  //           "appVersion":
  //               getIt<AppDetailService>().appDetails?.appVersion ?? "0.0.1"
  //         });
  //     if (response != null) {
  //       ExistingUserLoginModel userData =
  //           ExistingUserLoginModel.fromJson(response.data ?? {});
  //       return userData;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     debugPrint("error in getAuthTokenForExistUser $e");
  //     return null;
  //   }
  // }
  //
  // Future<RegisterUser?> registerUser(
  //     {required String firstName,
  //     required String lastName,
  //     required String contact,
  //     required String countryCode,
  //     required String gender}) async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiAddUserBasicDetails,
  //         requestType: RequestType.FORMDATA,
  //         body: {
  //           "firstName": firstName,
  //           "lastName": lastName,
  //           "contact": contact,
  //           "country_code": countryCode,
  //           "gender": gender
  //         });
  //     if (response != null) {
  //       RegisterUser userData = RegisterUser.fromJson(response.data ?? {});
  //       return userData;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //
  // Future<RegisterModelNew?> registerUserDetails({
  //   required int level,
  //   String? firstName,
  //   String? lastName,
  //   String? middleName,
  //   String? gender,
  //   String? dob,
  //   bool? isAvatarUsed,
  //   String? userImage,
  //   int? avatarId,
  //   String? motherFirstName,
  //   String? motherLastName,
  //   String? motherFatherName,
  //   String? fatherFirstName,
  //   String? fatherLastName,
  //   String? fatherFatherName,
  // }) async {
  //   debugPrint(motherFirstName);
  //   debugPrint(fatherFirstName);
  //   try {
  //     print("______ $level _______");
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: "$apiCompleteRegistration/step/$level",
  //         requestType: RequestType.FORMDATA,
  //         body: level == 1
  //             ? {
  //                 // "level": level,
  //                 "first_name": firstName,
  //                 "middle_name": middleName,
  //                 "last_name": lastName
  //               }
  //             : level == 2
  //                 ? {
  //                     // "level": level,
  //                     "date_of_birth": dob
  //                   }
  //                 : level == 3
  //                     ? {
  //                         // "level": level,
  //                         "gender": gender
  //                       }
  //                     : level == 4
  //                         ? (avatarId == 0 && userImage == '')
  //                             ? {'skipped': 1}
  //                             : isAvatarUsed!
  //                                 ? {'preseted_profile_image_id': avatarId}
  //                                 : {
  //                                     'profile_image':
  //                                         await MultipartFile.fromFile(
  //                                             userImage!,
  //                                             filename: "compress.jpg"),
  //                                   }
  //                         : level == 5
  //                             ? {
  //                                 "father_first_name": fatherFirstName,
  //                                 "father_last_name": fatherLastName,
  //                                 "grand_father_name": fatherFatherName
  //                               }
  //                             : {
  //                                 "mother_first_name": motherFirstName,
  //                                 "mother_last_name": motherLastName,
  //                                 "grand_father_name": motherFatherName
  //                               });
  //
  //     print("Re - ${response?.data}");
  //     if (response != null) {
  //       RegisterModelNew userData =
  //           RegisterModelNew.fromJson(response.data ?? {});
  //       return userData;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Ex $e");
  //     return null;
  //   }
  // }
  //
  // Future<UsernameLoginModel?> loginWithUsernameAndPassword({
  //   required String userName,
  //   required String userPassword,
  // }) async {
  //   print("BODY ${{
  //     "username": userName,
  //     "password": userPassword,
  //   }}");
  //   try {
  //     print(AppEnvironment.baseUrl);
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiLoginWithUserNamePassword,
  //         requestType: RequestType.FORMDATA,
  //         body: {
  //           "username": userName,
  //           "password": userPassword,
  //           // "deviceType": Platform.isAndroid ? "Android" : "Ios",
  //           // "appVersion":
  //           //     getIt<AppDetailService>().appDetails?.appVersion ?? "0.0.1",
  //           // "userlang": "en"
  //         });
  //     if (response!.data != null) {
  //       UsernameLoginModel userDetails =
  //           UsernameLoginModel.fromJson(response.data ?? {});
  //       if (userDetails.statusCode == 200) {
  //         return userDetails;
  //       } else {
  //         return null;
  //       }
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //
  // skipAddMember() async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiSkipMemberAddition,
  //         requestType: RequestType.FORMDATA,
  //         body: {
  //           "userId": getIt<LocalDataManager>().userId,
  //           "deviceType": Platform.isAndroid ? "1" : "2"
  //         });
  //   } catch (e) {}
  // }
  //
  // Future<AddMemberResponse> addMember(
  //     {required String memberfirstName,
  //     required String memberlastName,
  //     required bool memberisAlive,
  //     required String memberGender,
  //     required String memberRelation,
  //     String? memberContact = ""}) async {
  //   try {
  //     print(" From login_service ${getIt<LocalDataManager>().userId}");
  //     Map<String, dynamic> parameters = {
  //       "loggedUserId": getIt<LocalDataManager>().userId,
  //       "firstName": memberfirstName,
  //       "middleName": "",
  //       "lastName": memberlastName,
  //       "fatherName": "",
  //       "nativePlace": "",
  //       "memberAlive": memberisAlive ? "1" : "0",
  //       "gender": memberGender,
  //       "ageRange": "",
  //       "email": "",
  //       "mobile": memberContact,
  //       "addMobile": "",
  //       "senderId": "",
  //       "relation": memberRelation,
  //       "uncleId": "",
  //       "auntId": "",
  //       "countryCode": "91"
  //     };
  //     print(parameters);
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiAddMember,
  //         requestType: RequestType.FORMDATA,
  //         body: parameters);
  //     if (response != null) {
  //       print("RESSSSSS ${response.data}");
  //       Map<String, dynamic> data = response.data ?? {};
  //       int responseCode = (data["status"] as int);
  //       if (responseCode == 200) {
  //         AppDecoration.showToast(message: "Added Member");
  //         return AddMemberResponse(200, data["message"], true);
  //       } else if (responseCode == 409) {
  //         return AddMemberResponse(409, data["message"], false);
  //       } else {
  //         return AddMemberResponse(500, "Error", false);
  //       }
  //     } else {
  //       return AddMemberResponse(500, "Error", false);
  //     }
  //   } catch (e) {
  //     print(e);
  //     return AddMemberResponse(500, "Error", false);
  //   }
  // }
  //
  // Future<bool> resetPassword({
  //   required String userContact,
  //   required String userId,
  //   required String userPassword,
  //   required String OTP,
  // }) async {
  //   try {
  //     NetworkResponse? response = await ApiService().apiCall(
  //         url: apiResetPassword,
  //         requestType: RequestType.FORMDATA,
  //         body: {
  //           "userId": userId,
  //           "password": userPassword,
  //           "userOTP": OTP,
  //           "contact": userContact,
  //           "type": "RESET_PASSWORD"
  //         });
  //     if (response != null) {
  //       Map<String, dynamic> data = response.data ?? {};
  //       int responseCode = (data["status"] as int);
  //       if (responseCode == 200) {
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }
  //
  // Future<bool> resetPassword2({
  //   // required String userContact,
  //   // required String userId,
  //   required String userPassword,
  //   // required String userPassword,
  //   // required String OTP,
  // }) async {
  //   try {
  //     print("Body ${{
  //       // "userId": userId,
  //       "password": encryptData(userPassword),
  //       "password_confirmation": encryptData(userPassword)
  //       // "userOTP": OTP,
  //       // "contact": userContact,
  //       // "type": "RESET_PASSWORD"
  //     }}");
  //     NetworkResponse? response = await ApiService()
  //         .apiCall(url: apiResetPassword, requestType: RequestType.PUT, body: {
  //       // "userId": userId,
  //       "password": encryptData(userPassword),
  //       "password_confirmation": encryptData(userPassword)
  //       // "userOTP": OTP,
  //       // "contact": userContact,
  //       // "type": "RESET_PASSWORD"
  //     });
  //     log("reset password ${response?.data}");
  //     if (response != null) {
  //       Map<String, dynamic> data = response.data ?? {};
  //       int responseCode = (data["status_code"] as int);
  //       if (responseCode == 200) {
  //         debugPrint('00000*******');
  //         return true;
  //       } else {
  //         debugPrint('11111*******');
  //         return false;
  //       }
  //     } else {
  //       debugPrint('22222*******');
  //       return false;
  //     }
  //   } catch (e) {
  //     debugPrint('33333*******$e');
  //     return false;
  //   }
  // }

  encryptData(String? text) {
    String encryptedText = CryptoServices.deterministicEncrypt(text ?? "");
    return encryptedText;
  }
}

class AddMemberResponse {
  final int statusCode;
  final dynamic message;
  final bool isSuccess;

  AddMemberResponse(this.statusCode, this.message, this.isSuccess);
}
