import 'package:nutriya/model/NetworkResponse/network_response.dart';
import 'package:nutriya/repository/Analytics/analytics_helper.dart';
import 'package:nutriya/repository/ApiService/api_service_barrel.dart';

enum ProfileFormEnum {
  BasicInfo,
  ContactInfo,
  AdditionalInfo,
  RegionalInfo,
}

extension ProfileEnumExtension on ProfileFormEnum {
  String get value {
    switch (this) {
      case ProfileFormEnum.BasicInfo:
        return "BASIC_INFO";
      case ProfileFormEnum.ContactInfo:
        return "CONTACT_INFO";
      case ProfileFormEnum.AdditionalInfo:
        return "ADD_INFO";
      case ProfileFormEnum.RegionalInfo:
        return "REGIONAL_INFO";
    }
  }
}

class FormService {
  Future<bool> editForm({required Map<String, dynamic> body, String? url}) async {
    try {
      print(body);
      // AnalyticsHelper.shared.trackWebEngageEvent(eventName: "Profile Updated");
      NetworkResponse? response = await ApiService().apiCall(
        ///Todo : url should come from every place it got called
          url: url ?? apiEditBasicUserInfo,
          requestType: RequestType.PUT,
          body: body);
      if (response != null) {
        Map<String, dynamic> data = response.data ?? {};
        bool success = (data["success"] as bool);
        if (success) {
          return true;
        } else {
          return false;
        }
      } else {
        // Parsing Failed
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> addEducation({required Map<String, dynamic> body}) async {
    try {
      NetworkResponse? response = await ApiService().apiCall(
          url: apiUpdateEducationalUserInfo,
          requestType: RequestType.FORMDATA,
          body: body);
      if (response != null) {
        Map<String, dynamic> data = response.data ?? {};
        bool success = (data["success"] as bool);
        if (success) {
          return true;
        } else {
          return false;
        }
      } else {
        // Parsing Failed
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateEducation({required Map<String, dynamic> body, int? educationId}) async {
    try {
      NetworkResponse? response = await ApiService().apiCall(
          url: '$apiUpdateEducationalUserInfo/$educationId',
          requestType: RequestType.PUT,
          body: body);
      if (response != null) {
        Map<String, dynamic> data = response.data ?? {};
        bool success = (data["success"] as bool);
        if (success) {
          return true;
        } else {
          return false;
        }
      } else {
        // Parsing Failed
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteEducation({ int? educationId}) async {
    try {
      NetworkResponse? response = await ApiService().apiCall(
          url: '$apiUpdateEducationalUserInfo/$educationId',
          requestType: RequestType.DELETE);
      if (response != null) {
        Map<String, dynamic> data = response.data ?? {};
        bool success = (data["success"] as bool);
        if (success) {
          return true;
        } else {
          return false;
        }
      } else {
        // Parsing Failed
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> verifyEmailOtp({required Map<String, dynamic> body}) async {
    try {
      NetworkResponse? response = await ApiService().apiCall(
          url: apiChangeContactVerifyOtp,
          requestType: RequestType.FORMDATA,
          body: body);
      if (response != null) {
        Map<String, dynamic> data = response.data ?? {};
        bool success = (data["success"] as bool);
        if (success) {
          return true;
        } else {
          return false;
        }
      } else {
        // Parsing Failed
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> addInterest({required Map<String, dynamic> body}) async {
    try {
      NetworkResponse? response = await ApiService().apiCall(
          url: apiUpdateInterest, requestType: RequestType.PUT, body: body);
      if (response != null) {
        Map<String, dynamic> data = response.data ?? {};
        bool success = (data["success"] as bool);
        if (success) {
          return true;
        } else {
          return false;
        }
      } else {
        // Parsing Failed
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteInterest({required Map<String, dynamic> body}) async {
    try {
      NetworkResponse? response = await ApiService().apiCall(
          url: apiDeleteInterest,
          requestType: RequestType.FORMDATA,
          body: body);
      if (response != null) {
        Map<String, dynamic> data = response.data ?? {};
        int responseCode = (data["status"] as int);
        if (responseCode == 200) {
          return true;
        } else {
          return false;
        }
      } else {
        // Parsing Failed
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
