import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:nutriya/utils/LocalData/pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/NetworkResponse/network_response.dart';
import '../../repository/ApiService/api_service.dart';

String profileLink = "";

class LocalDataManager {
  SharedPreferences? prefs;

  String get userToken => prefs?.getString(prefAccessToken) ?? "";
  String get userId => prefs?.getString(prefUserId) ?? "";
  bool get isFirstLogin => prefs?.getBool(prefIsFirstLogin) ?? false;
  String get androidUuid => prefs?.getString(prefAndroidUniqueId) ?? "";
  String get userGender => prefs?.getString(prefUserGender) ?? "1";
  String get fullName => prefs?.getString(prefFullName) ?? "";
  String? get firstName => prefs?.getString(prefUserFirstName);
  String get userEmail => prefs?.getString(prefUserEmail) ?? "";
  String get userContact => prefs?.getString(prefUserContact) ?? "1";
  String get userProfiePic => prefs?.getString(prefProfilePic) ?? "";
  String get userName => prefs?.getString(prefUserName) ?? "";
  String get userFather => prefs?.getString(prefUserFatherName) ?? "";
  String get userDateOfBirth => prefs?.getString(prefUserDateofBirth) ?? "";
  bool get isLoggedInFromOtp => prefs?.getBool(prefUserFromOtp) ?? false;
  String get eventKinCoins => prefs?.getString("userEventsCoins") ?? "100";
  String get censusData => prefs?.getString(prefCensusForm) ?? "";
  String get userLang => prefs?.getString(prefUserLanguage) ?? "en";
  bool get chatStatus => prefs?.getBool(prefChatStatus) ?? false;

// coachmarks
  int get dashboardCoachMark {
    return prefs?.getInt(prefDashCoachdone) ?? 0;
  }

  int get postCoachMark {
    return prefs?.getInt(prefPostCoachdone) ?? 0;
  }

  int get pollCoachMark {
    return prefs?.getInt(prefPollCoachdone) ?? 0;
  }

  int get eventCoachMark {
    return prefs?.getInt(prefEventCoachdone) ?? 0;
  }

//  Global Search

  // String get decodedRecentSearchMember {
  //   return prefs?.getString(prefRecentSearchedList) ?? "";
  // }

  initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

// coach marks{
  setDashCountDone(int val) async {
    await prefs?.setInt(prefDashCoachdone, val);
  }

  setPostCountDone(int val) async {
    await prefs?.setInt(prefPostCoachdone, val);
  }

  setPollCountDone(int val) async {
    await prefs?.setInt(prefPollCoachdone, val);
  }

  setEventCountDone(int val) async {
    await prefs?.setInt(prefEventCoachdone, val);
  }

 setChatStatus(bool chatStatus) async {
    await prefs?.setBool(prefChatStatus, chatStatus);
  }

  // }

  // GlobalSearch {

  // setRecentGlobalSearchedImg(String val) async {
  //   await prefs?.setString(prefRecentSearchedImg, val);
  // }

  // setRecentGlobalSearchedFirst(String val) async {
  //   await prefs?.setString(prefRecentSearchedImg, val);
  // }

  // setRecentGlobalSearchedLast(String val) async {
  //   await prefs?.setString(prefRecentSearchedImg, val);
  // }

  // setRecentGlobalSearchedList(String val) async {
  //   await prefs?.setStringList(prefRecentSearchedList);
  // }
  // }

  setUserToken(String userToken) async {
    await prefs?.setString(prefAccessToken, userToken);
  }

  Future<String?> getFcmToken() async {
    if (Platform.isIOS) {
      MethodChannel methodChannel = MethodChannel("kintreeMethodChannel");
      String? fcmToken = await methodChannel.invokeMethod('getFcmToken');
      return fcmToken;
    } else {
      return "";
    }
  }

  loginWebEngage() async {
    if (Platform.isIOS) {
      MethodChannel methodChannel = MethodChannel("kintreeMethodChannel");
      String? fcmToken = await methodChannel
          .invokeMethod('loginWebEngage', {"userId": "123445"});
      return fcmToken;
    } else {
      return "";
    }
  }

  setUserId(String userId) async {
    await prefs?.setString(prefUserId, userId);
  }

  setFirstLogin(bool isFirstLogin) async {
    await prefs?.setBool(prefIsFirstLogin, isFirstLogin);
  }

  setUniqueAndroidId(String id) async {
    if (prefs?.getString(prefAndroidUniqueId) == null ||
        prefs?.getString(prefAndroidUniqueId) == "") {
      await prefs?.setString(prefAndroidUniqueId, id);
    }
  }

  setCensusData(String censusData) async {
    await prefs?.setString(prefCensusForm, censusData);
  }

  setUserGender(String gender) async {
    await prefs?.setString(prefUserGender, gender);
  }

  setFullName(String name) async {
    await prefs?.setString(prefFullName, name);
  }

  setFirstName(String name) async {
    await prefs?.setString(prefUserFirstName, name);
  }

  setEmail(String name) async {
    await prefs?.setString(prefUserEmail, name);
  }

  setContact(String name) async {
    await prefs?.setString(prefUserContact, name);
  }

  setProfilePic(String name) async {
    await prefs?.setString(prefProfilePic, name);
    print(userProfiePic);
  }

  setCoverProfilePic(String name) async {
    await prefs?.setString(prefCoverProfilePic, name);
    print(userProfiePic);
  }

  setUserName(String name) async {
    await prefs?.setString(prefUserName, name);
  }

  setFromOtp(bool isfromOtp) async {
    await prefs?.setBool(prefUserFromOtp, isfromOtp);
  }

  setFatherName(String fatherName) async {
    await prefs?.setString(prefUserFatherName, fatherName);
  }

  setMotherName(String motherName) async {
    await prefs?.setString(prefUserMotherName, motherName);
  }

  setDateofBirth(String dateOfBirth) async {
    await prefs?.setString(prefUserDateofBirth, dateOfBirth);
  }

  setEventCoins(String eventCoins) async {
    await prefs?.setString(prefEventKinCoins, eventCoins);
  }

  setUserSelectedLanguage(String userLanguageCode) async {
    await prefs?.setString(prefUserLanguage, userLanguageCode);
  }

  clearPrefrence() async {
    await prefs?.remove(prefAccessToken);
    await prefs?.remove(prefUserId);
    await prefs?.remove(prefIsFirstLogin);
    await prefs?.remove(prefAndroidUniqueId);
    await prefs?.remove(prefUserGender);
    await prefs?.remove(prefFullName);
    await prefs?.remove(prefUserFirstName);
    await prefs?.remove(prefUserEmail);
    await prefs?.remove(prefUserContact);
    await prefs?.remove(prefProfilePic);
    await prefs?.remove(prefUserName);
    await prefs?.remove(prefUserFromOtp);
    await prefs?.remove(prefUserFatherName);
    await prefs?.remove(prefUserDateofBirth);
    await prefs?.remove(prefEventKinCoins);
    await prefs?.remove(prefCensusForm);
    await prefs?.remove(prefUserLanguage);
  }
}
