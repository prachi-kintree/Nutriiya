import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../RouteManager/route_manager.dart';
import '../../repository/FirebaseAuth/firebase_authservice.dart';
import '../../repository/LoginService/login_service.dart';
import '../../utils/crypto/crypto_services.dart';

enum LoginType { email, mobile, username }

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(
      {required this.loginservice});

  LoginService loginservice;
  // FirebaseAuthService firebaseAuthService;
  LoginType loginType = LoginType.mobile;
  String userEmail = "";
  String userPhoneNumber = "";
  String numberPrefix = "+91";
  String countryFlag =
      "https://api.kintree.com/kintree-assets/images/countries/in.png";
  String enteredOtp = "";
  bool showInvalidOtp = false;
  bool enableBtn = false;
  bool isRegister = false;
  bool isOtpSent = false;
  // CountryModel? countryData;
  bool isIndianUser = false;
  TextEditingController otpController = TextEditingController();

  getEnumFromString(String type) {
    switch (type) {
      case "Mobile Number":
        return LoginType.mobile;
      case "Email ID":
        return LoginType.email;
      case "Username":
        return LoginType.username;
      default:
        return LoginType.mobile;
    }
  }

  setOtpStatus(bool status) {
    isOtpSent = status;
    notifyListeners();
  }

  changeFieldType(LoginType type) {
    loginType = type;
    enableBtn = false;
    notifyListeners();
  }

  clearUserData() {
    userEmail = "";
    userPhoneNumber = "";
    enteredOtp = "";
    notifyListeners();
  }

  resetOtpVariable() {
    enteredOtp = "";
    otpController.text = "";
    showInvalidOtp = false;
    //enableBtn = false;
    isRegister = false;
    isIndianUser = false;
  }

  submitOTP(String userOtp) {
    enteredOtp = userOtp;
    showInvalidOtp = false;

    notifyListeners();
  }

  prefillOtpIfReceived(String? otpReceived) {
    enteredOtp = otpReceived ?? "";
    notifyListeners();
  }

  invalidOtp() {
    showInvalidOtp = true;
    notifyListeners();
  }

  shouldEnableBtn(String text) {
    if (text.isNotEmpty) {
      enableBtn = true;
    } else {
      enableBtn = false;
    }
    notifyListeners();
  }

  captureUserInput(String userInput) {
    if (loginType == LoginType.email) {
      userEmail = userInput.trim();
    } else {
      userPhoneNumber = userInput;
    }
  }

  changeCountryCode(
      {required String countryCode, required String countryFlag}) {
    numberPrefix = countryCode;
    this.countryFlag = countryFlag;
    notifyListeners();
  }

  // requestForResendOtp({Function(String?)? codeRecieved}) async {
  //   if (loginType == LoginType.email) {
  //     await loginservice.sendOtpNew(
  //         contactType: "email", contact: userEmail, callBank: (value) {});
  //   } else {
  //     if (isIndianUser) {
  //       await loginservice.sendOtpToIndianUser(
  //           contactType: "phone_no",
  //           contact: userPhoneNumber,
  //           callBank: (value) {
  //             if (value) {
  //             } else {
  //               print("+++++++++++++++++++++++++++++++++++1");
  //               AppDecoration.showToast(message: "Invalid Mobile Number");
  //             }
  //           });
  //     } else {
  //       firebaseAuthService.requestForOtp(
  //           withPhoneNumber: numberPrefix + userPhoneNumber,
  //           codeReceived: (String? receivedOtp) {
  //             prefillOtpIfReceived(receivedOtp);
  //           },
  //           onFailed: () {});
  //     }
  //   }
  // }
  //
  // validateLogin(
  //     {required Function startLoading,
  //       required Function stopLoading,
  //       Function(String?)? codeRecievedForPhoneNumber}) async {
  //   startLoading();
  //   resetOtpVariable();
  //   if (loginType == LoginType.email) {
  //     RegisterModel? data =
  //     await loginservice.checkUserExist(contact: userEmail);
  //
  //     if (data != null) {
  //       isRegister = data.data.isRegistered;
  //       stopLoading();
  //       setOtpStatus(true);
  //       // appNavigator.pushNamed(routeOtpLogin);
  //     }
  //   } else {
  //     //throw "abc";
  //
  //     await SmsAutoFill().listenForCode(smsCodeRegexPattern: "^\d{6}");
  //     startLoading();
  //     RegisterModel? data =
  //     await loginservice.checkUserExist(contact: userPhoneNumber);
  //
  //     if (data != null) {
  //       isRegister = data.data.isRegistered;
  //     }
  //
  //     isIndianUser = numberPrefix.replaceAll("+", "") == "91";
  //
  //     if (isIndianUser) {
  //       await loginservice.sendOtpToIndianUser(
  //           contactType: "phone_no",
  //           contact: userPhoneNumber,
  //           callBank: (value) {
  //             if (value) {
  //               stopLoading();
  //               setOtpStatus(true);
  //             } else {
  //               stopLoading();
  //               print("+++++++++++++++++++++++++++++++++++2");
  //
  //               AppDecoration.showToast(message: "Invalid Mobile Number");
  //             }
  //           });
  //     } else {
  //       try {
  //         await firebaseAuthService.requestForOtp(
  //             withPhoneNumber: numberPrefix + userPhoneNumber,
  //             codeReceived: (String? otpReceived) {
  //               stopLoading();
  //               setOtpStatus(true);
  //             },
  //             onFailed: () {
  //               stopLoading();
  //             });
  //       } catch (e) {
  //         print("+++++++++++++++++++++++++++++++++++3");
  //
  //         AppDecoration.showToast(message: "Invalid Mobile Number");
  //       }
  //     }
  //   }
  //   stopLoading();
  // }
  //
  // validateLoginNew(
  //     {required Function startLoading,
  //       required Function stopLoading,
  //       Function(String?)? codeRecievedForPhoneNumber}) async {
  //   startLoading();
  //   resetOtpVariable();
  //   if (loginType == LoginType.email) {
  //     bool? status = await loginservice.sendOtpNew(
  //         contactType: "email",
  //         contact: encryptData(userEmail),
  //         callBank: (value) {
  //           if (value) {
  //             stopLoading();
  //             setOtpStatus(value);
  //           } else {
  //             stopLoading();
  //             AppDecoration.showToast(message: "Invalid Email");
  //           }
  //         });
  //
  //     // if (status == true) {
  //     //   // isRegister = data.data.isRegistered;
  //     //   stopLoading();
  //     //   setOtpStatus(true);
  //     //   // appNavigator.pushNamed(routeOtpLogin);
  //     // }
  //   } else {
  //     //throw "abc";
  //
  //     await SmsAutoFill().listenForCode(smsCodeRegexPattern: "^\d{6}");
  //     startLoading();
  //     // String? status =
  //     //     await loginservice.sendOtpNew(contactType: "email",contact: userPhoneNumber);
  //
  //     // if (status == true) {
  //     //   // isRegister = data.data.isRegistered;
  //     // }
  //
  //     isIndianUser = numberPrefix.replaceAll("+", "") == "91";
  //
  //     if (isIndianUser) {
  //       await loginservice.sendOtpNew(
  //           contactType: "phone_no",
  //           contact: encryptData("+91$userPhoneNumber"),
  //           callBank: (value) {
  //             if (value) {
  //               stopLoading();
  //               setOtpStatus(true);
  //             } else {
  //               stopLoading();
  //               print("+++++++++++++++++++++++++++++++++++4");
  //
  //               AppDecoration.showToast(message: "Invalid Mobile Number");
  //             }
  //           });
  //     } else {
  //       try {
  //         await firebaseAuthService.requestForOtp(
  //             withPhoneNumber: numberPrefix + userPhoneNumber,
  //             codeReceived: (String? otpReceived) {
  //               stopLoading();
  //               setOtpStatus(true);
  //             },
  //             onFailed: () {
  //               stopLoading();
  //             });
  //       } catch (e) {
  //         print("+++++++++++++++++++++++++++++++++++5");
  //
  //         AppDecoration.showToast(message: "Invalid Mobile Number");
  //       }
  //     }
  //   }
  //   stopLoading();
  // }

// Case 1
  /// If the user is already register and get the auth token and store
  /// it in local data using local data manager
  /// if the user has not added the member take him to add member else to dashborad

  /// Case 2
  /// If the user is a new user and once the otp is verified take him to add basic detail page

  // validateOtp(
  //     {required Function startLoading, required Function stopLoading}) async {
  //   startLoading();
  //   if (loginType == LoginType.email) {
  //     var result = await loginservice.validateEmailOtp(
  //         contactType: "email", contact: userEmail, otp: enteredOtp);
  //     bool isValid = result["isValid"];
  //
  //     if (isValid) {
  //       if (isRegister) {
  //         // AppDecoration.showToast(message: "Welcome ${controller.}");
  //         ExistingUserLoginModel? userData = await loginservice
  //             .getAuthTokenForExistingUser(userName: userEmail.trim());
  //         if (userData != null) {
  //           print("Set from login_vm1");
  //           getIt<LocalDataManager>()
  //               .setChatStatus(response.data?.isChatEnabled ?? false);
  //           getIt<LocalDataManager>()
  //               .setUserToken(userData.result?.authToken ?? "No Auth");
  //           getIt<LocalDataManager>().setUserId(userData.result?.userId ?? "");
  //           getIt<LocalDataManager>().setUserGender(
  //               userData.result?.gender.toString() ?? "No Gender");
  //           getIt<LocalDataManager>().setFromOtp(true);
  //           AnalyticsHelper.shared
  //               .trackUserEvent(eventName: "verify_otp_success_login");
  //           appNavigator.pushNamed(routeDashboard);
  //           return;
  //         }
  //
  //         if (userData?.result?.showTour ?? false) {
  //           stopLoading();
  //           getIt<LocalDataManager>().setFromOtp(true);
  //           resetOtpVariable();
  //           appNavigator.pushNamed(routeAddMember);
  //         } else {
  //           stopLoading();
  //           getIt<LocalDataManager>().setFromOtp(true);
  //           AppDecoration.showToast(
  //               message:
  //                   "Welcome To Kintree ${userData?.result?.userFirstname}");
  //         }
  //       } else {
  //         resetOtpVariable();
  //         stopLoading();
  //         appNavigator.pushNamed(routeVerifiedSuccess);
  //         // appNavigator.pushNamed(routeLoginBasicDetail);
  //       }
  //     } else {
  //       stopLoading();
  //       invalidOtp();
  //     }
  //   } else {
  //     // When
  //
  //     if (isIndianUser) {
  //       RegisterModelNew? response =
  //           await loginservice.validateEmailOtpforIndianUser(
  //               contactType: "phone_no",
  //               contact: "+91$userPhoneNumber",
  //               otp: enteredOtp);
  //       if (response != null) {
  //         if (response.success) {
  //           if (isRegister) {
  //             ExistingUserLoginModel? userData =
  //                 await loginservice.getAuthTokenForExistingUser(
  //                     userName: userPhoneNumber.trim());
  //             if (userData != null) {
  //               print("Set from login_vm2");
  //
  //               getIt<LocalDataManager>()
  //                   .setUserToken(userData.result?.authToken ?? "No Auth");
  //               getIt<LocalDataManager>()
  //                   .setUserId(userData.result?.userId ?? "");
  //               getIt<LocalDataManager>().setUserGender(
  //                   userData.result?.gender.toString() ?? "No Gender");
  //               appNavigator.pushNamed(routeDashboard);
  //               return;
  //             }
  //             if (userData?.result?.showTour ?? false) {
  //               stopLoading();
  //               appNavigator.pushNamed(routeAddMember);
  //             } else {
  //               stopLoading();
  //               AppDecoration.showToast(
  //                   message:
  //                       "Welcome To Kintree ${userData?.result?.userFirstname}");
  //             }
  //           } else {
  //             stopLoading();
  //             // appNavigator.pushNamed(routeVerifiedSuccess);
  //             appNavigator.pushNamed(routeLoginBasicDetail);
  //           }
  //         } else {
  //           stopLoading();
  //           invalidOtp();
  //         }
  //       }
  //     } else {
  //       bool isValid = await firebaseAuthService.verifyOTPCode(enteredOtp);
  //       if (isValid) {
  //         if (isRegister) {
  //           ExistingUserLoginModel? userData = await loginservice
  //               .getAuthTokenForExistingUser(userName: userPhoneNumber.trim());
  //           if (userData != null) {
  //             print("Set from login_vm3");
  //
  //             getIt<LocalDataManager>()
  //                 .setUserToken(userData.result?.authToken ?? "No Auth");
  //             getIt<LocalDataManager>()
  //                 .setUserId(userData.result?.userId ?? "");
  //             getIt<LocalDataManager>().setUserGender(
  //                 userData.result?.gender.toString() ?? "No Gender");
  //             appNavigator.pushNamed(routeDashboard);
  //             return;
  //           }
  //           if (userData?.result?.showTour ?? false) {
  //             stopLoading();
  //             appNavigator.pushNamed(routeAddMember);
  //           } else {
  //             stopLoading();
  //             AppDecoration.showToast(
  //                 message:
  //                     "Welcome To Kintree ${userData?.result?.userFirstname}");
  //           }
  //         } else {
  //           stopLoading();
  //           // appNavigator.pushNamed(routeVerifiedSuccess);
  //           appNavigator.pushNamed(routeLoginBasicDetail);
  //         }
  //       } else {
  //         stopLoading();
  //         invalidOtp();
  //       }
  //     }
  //   }
  // }

  // validateOtpNew(
  //     {required Function startLoading, required Function stopLoading}) async {
  //   startLoading();
  //   if (loginType == LoginType.email) {
  //     RegisterModelNew? response = await loginservice.validateOtpNew(
  //         contact: encryptData(userEmail), contactType: "email", otp: enteredOtp);
  //
  //     isRegister = response?.data?.isRegistrationComplete == 1;
  //     if (response != null) {
  //       if (response.success) {
  //         if (isRegister) {
  //           print("Set from login_vm4");
  //           getIt<LocalDataManager>().setFirstLogin(true);
  //           getIt<LocalDataManager>()
  //               .setUserSelectedLanguage(response.data?.language ?? "en");
  //           appNavigator.navigationContext?.setLocale(Locale(response.data?.language ?? "en"));
  //           getIt<LocalDataManager>()
  //               .setUserToken(response.data?.token ?? "No Auth");
  //           // AppDecoration.showToast(message: "Welcome ${controller.}");
  //           // ExistingUserLoginModel? userData = await loginservice
  //           //       .getAuthTokenForExistingUser(userName: userEmail.trim());
  //           if (response.data != null) {
  //             print("Set from login_vm5");
  //             // getIt<LocalDataManager>()
  //             //     .setChatStatus(response.data?.isChatEnabled ?? false);
  //             getIt<LocalDataManager>()
  //                 .setUserToken(response.data?.token ?? "No Auth");
  //             getIt<LocalDataManager>()
  //                 .setUserId(response.data?.uId.toString() ?? "");
  //             getIt<LocalDataManager>().setUserGender(
  //                 response.data?.gender.toString() ?? "No Gender");
  //             getIt<LocalDataManager>().setFromOtp(true);
  //             AnalyticsHelper.shared
  //                 .trackUserEvent(eventName: "verify_otp_success_login");
  //             hasLogout = false;
  //             appNavigator.pushNamed(routeDashboard);
  //             return;
  //           }
  //
  //           // if (userData?.result?.showTour ?? false) {
  //           //   stopLoading();
  //           //   getIt<LocalDataManager>().setFromOtp(true);
  //           //   resetOtpVariable();
  //           //   appNavigator.pushNamed(routeAddMember);
  //           // } else {
  //           stopLoading();
  //           getIt<LocalDataManager>().setFromOtp(true);
  //           AppDecoration.showToast(
  //               message: "Welcome To Kintree ${response.data?.firstName}");
  //           // }
  //         } else {
  //           print("Set from login_vm6");
  //           getIt<LocalDataManager>().setFirstLogin(true);
  //           // getIt<LocalDataManager>()
  //           //     .setChatStatus(response.data?.isChatEnabled ?? false);
  //           getIt<LocalDataManager>()
  //               .setUserToken(response.data?.token ?? "No Auth");
  //           resetOtpVariable();
  //           stopLoading();
  //           appNavigator.pushNamed(routeVerifiedSuccess);
  //           // appNavigator.pushNamed(routeLoginBasicDetail);
  //         }
  //       } else {
  //         stopLoading();
  //         invalidOtp();
  //       }
  //     } else {
  //       stopLoading();
  //       invalidOtp();
  //     }
  //   } else {
  //     // When
  //
  //     if (isIndianUser) {
  //       RegisterModelNew? response =
  //       await loginservice.validateEmailOtpforIndianUser(
  //           contactType: "phone_no",
  //           contact: encryptData("+91$userPhoneNumber"),
  //           otp: enteredOtp);
  //       isRegister = response?.data?.isRegistrationComplete == 1;
  //       if (response != null) {
  //         if (response.success) {
  //           if (isRegister) {
  //             // ExistingUserLoginModel? userData =
  //             //     await loginservice.getAuthTokenForExistingUser(
  //             //         userName: userPhoneNumber.trim());
  //             // log("user data after phone number login ${userData}");
  //             if (response.data != null) {
  //               print("Set from login_vm7");
  //               // getIt<LocalDataManager>()
  //               //     .setChatStatus(response.data?.isChatEnabled ?? false);
  //               getIt<LocalDataManager>()
  //                   .setUserToken(response.data?.token ?? "No Auth");
  //               getIt<LocalDataManager>()
  //                   .setUserId(response.data?.uId.toString() ?? "");
  //               getIt<LocalDataManager>().setUserGender(
  //                   response.data?.gender.toString() ?? "No Gender");
  //               appNavigator.pushNamed(routeDashboard);
  //               hasLogout = false;
  //               return;
  //             }
  //             // if (userData?.result?.showTour ?? false) {
  //             //   stopLoading();
  //             //   appNavigator.pushNamed(routeAddMember);
  //             // } else {
  //             //   stopLoading();
  //             //   AppDecoration.showToast(
  //             //       message:
  //             //           "Welcome To Kintree ${userData?.result?.userFirstname}");
  //             // }
  //           } else {
  //             print("Token : ${response.data?.token}");
  //
  //             print("Set from login_vm8");
  //             // getIt<LocalDataManager>()
  //             //     .setChatStatus(response.data?.isChatEnabled ?? false);
  //             getIt<LocalDataManager>()
  //                 .setUserToken(response.data?.token ?? "No Auth");
  //             resetOtpVariable();
  //
  //             stopLoading();
  //             appNavigator.pushNamed(routeVerifiedSuccess);
  //           }
  //         } else {
  //           stopLoading();
  //           invalidOtp();
  //         }
  //       } else {
  //         stopLoading();
  //         invalidOtp();
  //       }
  //     } else {
  //       bool isValid = await firebaseAuthService.verifyOTPCode(enteredOtp);
  //       if (isValid) {
  //         if (isRegister) {
  //           ExistingUserLoginModel? userData = await loginservice
  //               .getAuthTokenForExistingUser(userName: userPhoneNumber.trim());
  //           if (userData != null) {
  //             print("Set from login_vm9");
  //             // getIt<LocalDataManager>()
  //             //     .setChatStatus(userData.result?.isChatEnabled ?? false);
  //             getIt<LocalDataManager>()
  //                 .setUserToken(userData.result?.authToken ?? "No Auth");
  //             getIt<LocalDataManager>()
  //                 .setUserId(userData.result?.userId ?? "");
  //             getIt<LocalDataManager>().setUserGender(
  //                 userData.result?.gender.toString() ?? "No Gender");
  //             appNavigator.pushNamed(routeDashboard);
  //             hasLogout = false;
  //             return;
  //           }
  //           if (userData?.result?.showTour ?? false) {
  //             stopLoading();
  //             appNavigator.pushNamed(routeAddMember);
  //           } else {
  //             stopLoading();
  //             AppDecoration.showToast(
  //                 message:
  //                 "Welcome To Kintree ${userData?.result?.userFirstname}");
  //           }
  //         } else {
  //           stopLoading();
  //           appNavigator.pushNamed(routeVerifiedSuccess);
  //         }
  //       } else {
  //         stopLoading();
  //         invalidOtp();
  //       }
  //     }
  //   }
  // }
  //
  // encryptData(String? text) {
  //   String encryptedText = CryptoServices.deterministicEncrypt(text ?? "");
  //   return encryptedText;
  // }
}
