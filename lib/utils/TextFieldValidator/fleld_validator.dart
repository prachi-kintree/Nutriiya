import 'package:easy_localization/easy_localization.dart';
import 'package:nutriya/extension/extension_string.dart';

import '../../translation/locale_keys.g.dart';
import '../app_string/app_error_string.dart';

class FieldValidator {
  String? validateEmail(String? text) {
    if (text?.trim().isEmpty ?? false) {
      return LocaleKeys.forgot_email_text.tr();
    } else if (!(text?.trim().validateEmail() ?? false)) {
      return LocaleKeys.error_invalid_email.tr();
    } else {
      return null;
    }
  }

String? validateMobileWithMessage(String? text, String? message) {
  if ((text ?? "").trim().isEmpty) {
    return message ?? LocaleKeys.forgot_mobile_number_text.tr();
  } else if (((text ?? "").trim().length) < 10) {
    return "Invalid Phone Number";
  } else {
    return null;
  }
  }

  String? validateMobileNumber(String? text) {
    if ((text ?? "").trim().isEmpty) {
      return errorEmptyMobileNumber;
    } else if (((text ?? "").trim().length) < 10) {
      return "Invalid Phone Number";
    } else {
      return null;
    }
  }

  String? validateMobileNumberorLandLine(String? text, String? message) {
    if ((text ?? "").trim().isEmpty) {
      return message ?? errorEmptyMobileNumber;
    } else if (((text ?? "").trim().length) < 10) {
      return "Invalid Phone Number";
    } else {
      return null;
    }
  }

  String? validateEmailOrMobile({String? text, bool? isEmail}) {
    if (text?.trim().isEmpty ?? false) {
      return "Hey, looks like you forgot to enter your email/mobile";
    } else if (isEmail ?? false) {
      return validateEmail(text?.trim());
    } else if (!isEmail!) {
      return validateMobileNumber(text?.trim());
    } else {
      return null;
    }
  }

  String? validateName({String? text, String? message}) {
    if ((text?.isNotEmpty ?? false) && (text ?? "").isValidName()) {
      return null;
    }
    return message ?? "Enter Valid Name";
  }

  String? validatePassword(String? text, String? message) {
    if (text?.isNotEmpty ?? false) {
      return null;
    }

    return message == null ? LocaleKeys.error_invalid_password.tr() : message;
  }

  String? isNotEmpty({String? text, String? message}) {
    if (text?.trim().isNotEmpty ?? false) {
      return null;
    }
    return message == null ? "Error" : message;
  }

  String? isNotEmptyAndDiff(
      {String? text, String? prevtext, String? message, String? message2}) {
    if (text?.trim().isEmpty ?? false) {
      return message == null ? "Error" : message;
    } else if (text!.contains(prevtext!)) {
      return message == null ? "Error" : message2;
    }

    return null;
  }
}
