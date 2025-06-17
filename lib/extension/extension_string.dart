import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';

import '../translation/locale_keys.g.dart';
import '../utils/regex/app_regex.dart';


extension Validator on String {
  bool validateEmail() {
    return RegExp(regexEmail).hasMatch(this);
  }

  bool isValidName() {
    return RegExp(regexAcceptAlphabetsAndSpace).hasMatch(this);
  }

  bool isNumeric() {
    RegExp _numeric = RegExp(regexOnlyNumber);
    return _numeric.hasMatch(this);
  }

  String getCountryCode() {
    print(this);
    if (this.contains("+")) {
      List<String> splits = this.split(" ");
      if (splits.length > 0) {
        return splits[0] == this ? "" : splits[0];
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  String toSentenceCase() {
    return this.isEmpty
        ? this
        : "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String showDashOrString() {
    return this.isEmpty ? "-" : this;
  }

  String isMaleorFemale({String? defaultValue}) {
    return this.isEmpty
        ? defaultValue == null
            ? "-"
            : defaultValue
        : this == "m"
            ? LocaleKeys.general_male.tr()
            : LocaleKeys.general_female.tr();
  }

  bool isPublicOrPrivate({bool? defaultValue}) {
    return this.isEmpty
        ? defaultValue == null
            ? false
            : defaultValue
        : this.toLowerCase() == "public"
            ? false
            : true;
  }

  String getFormattedTime() {
    try {
      DateTime time = DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
      String formattedTime = DateFormat('hh:mm a').format(time);
      return formattedTime;
    } catch (e) {
      throw ("Invalid Format");
    }
  }

  String getDayFromDate({String dateFormatToPass = "dd-MM-yyyy"}) {
    DateTime date = DateFormat('dd-MM-yyyy').parse(this);
    String day = DateFormat('dd').format(date);
    return day;
  }

  String getDayFromDateNew() {
    try {
      // Parse the full datetime string with the correct format
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);

      // Extract the day from the DateTime object
      String day = DateFormat('dd').format(date);

      return day;
    } catch (e) {
      print("Error parsing date: $this");
      throw ("Invalid Format");
    }
  }

  String getTextDayFromDate({String dateFormatToPass = "dd-MM-yyyy"}) {
    DateTime date = DateFormat('dd-MM-yyyy').parse(this);
    String day = DateFormat('EEEE').format(date);
    return day;
  }

  String getShortMonth() {
    DateTime date = DateFormat('dd-MM-yyyy').parse(this);
    return DateFormat.MMM().format(date);
  }

  String getShortMonthNew() {
    try {
      // Parse the input string into a DateTime object using the correct format
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
      // Get the short month name (e.g., "Dec" for December)
      return DateFormat.MMM().format(date);
    } catch (e) {
      print("Error parsing date: $this");
      throw ("Invalid Format");
    }
  }

  DateTime toDateTime(String format) {
    return DateFormat(format).parse(this);
  }

  DateTime toDateTimeFrom24HourFormat() {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Parse the time string and set the time components
    List<String> timeParts = this.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    return DateTime(
        currentDate.year, currentDate.month, currentDate.day, hour, minute);
  }

  shouldAddBaseUrl() {
    // if (!this.contains(AppEnvironment.baseUrl)) {
    //   return AppEnvironment.baseUrl + this;
    // } else {
    //   return this;
    // }
  }

  String timeElapsedFromToday() {
    DateTime dateTime = DateTime.parse(this);
    DateTime now = DateTime.now();

    // Calculate the duration in "ago" format
    Duration difference = now.difference(dateTime);
    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? LocaleKeys.comment_days_singular.tr() : LocaleKeys.comment_days_plural.tr()} ${LocaleKeys.comment_duration.tr().trim()}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? LocaleKeys.comment_hours_singular.tr() : LocaleKeys.comment_hours_plural.tr()} ${LocaleKeys.comment_duration.tr().trim()}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? LocaleKeys.comment_minutes_singular.tr() : LocaleKeys.comment_minutes_plural.tr()} ${LocaleKeys.comment_duration.tr().trim()}';
    } else if (difference.inSeconds > 0) {
      return '${difference.inSeconds} ${difference.inSeconds == 1 ? LocaleKeys.comment_seconds_singular.tr() : LocaleKeys.comment_seconds_plural.tr()} ${LocaleKeys.comment_duration.tr().trim()}';
    } else {
      return LocaleKeys.just_now.tr();
    }
  }

  String limitCharacters(int maxLength) {
    if (this.length <= maxLength) {
      return this;
    } else {
      return this.substring(0, maxLength) + "...";
    }
  }

  String tosha256() {
    final bytes = utf8.encode(this);
    final digest = sha256.convert(bytes);

    return digest.toString();
  }

  String decodeBase64() {
    String decoded = utf8.decode(base64.decode(this));
    return decoded;
  }

  String formatDateString({String format = 'dd MMMM yyyy'}) {
    DateTime date = DateTime.parse(this);
    return DateFormat(format).format(date);
  }

  String convertToDnaFormat() {
    if (this.isNotEmpty) {
      DateTime date = DateFormat('yyyy-MM-dd').parse(this);
      return DateFormat('dd MMMM yyyy').format(date);
    } else {
      return "";
    }
  }

  String convertToYMDFormat() {
    if (this.isNotEmpty) {
      DateTime date =
          DateFormat('dd MMMM yyyy').parse(this.replaceAll(",", ""));
      return DateFormat('yyyy-MM-dd').format(date);
    } else {
      return "";
    }
  }

  // getFormatedCoins() {
  //   int value = int.parse(this);
  //   if(value > 999999999999999) {
  //     if(RegExp(r'\d*000000000000000$').hasMatch(value.toString())) {
  //       return (value ~/ 1000000000000000).toString() + 'Q';
  //     } else {
  //       return (value ~/ 1000000000000000).toString() + "Q+";
  //     }
  //   } else {
  //     if(value > 999999999999) {
  //       if(RegExp(r'\d*000000000000$').hasMatch(value.toString())) {
  //         return (value ~/ 1000000000000).toString() + 'T';
  //       } else {
  //         return (value ~/ 1000000000000).toString() + "T+";
  //       }
  //     } else {
  //       if(value > 999999999) {
  //         if(RegExp(r'\d*000000000$').hasMatch(value.toString())) {
  //           return (value ~/ 1000000000).toString() + 'B';
  //         } else {
  //           return (value ~/ 1000000000).toString() + "B+";
  //         }
  //       } else {
  //         if(value > 999999) {
  //           if(RegExp(r'\d*000000$').hasMatch(value.toString())) {
  //             return (value ~/ 1000000).toString() + 'M';
  //           } else {
  //             return (value ~/ 1000000).toString() + "M+";
  //           }
  //         } else {
  //           if (value > 999) {
  //             if (RegExp(r'\d*000$').hasMatch(value.toString())) {
  //               return (value ~/ 1000).toString() + 'K';
  //             } else {
  //               return (value ~/ 1000).toString() + 'K+';
  //             }
  //           } else {
  //             return value.toString();
  //           }
  //         }
  //       }
  //     }
  //   }
  //
  //
  //   // if (value > 999) {
  //   //   if (RegExp(r'\d*000$').hasMatch(value.toString())) {
  //   //     return (value ~/ 1000).toString() + 'K';
  //   //   } else {
  //   //     return (value ~/ 1000).toString() + 'K+';
  //   //   }
  //   // } else {
  //   //   return value.toString();
  //   // }
  // }

  String getFormatedCoins() {
    int value = int.parse(this);
    List<Map<String, int>> units = [
      {'Q': 1000000000000000}, // Quadrillion
      {'T': 1000000000000}, // Trillion
      {'B': 1000000000}, // Billion
      {'M': 1000000}, // Million
      {'K': 1000} // Thousand
    ];

    for (var unit in units) {
      String symbol = unit.keys.first;
      int divisor = unit[symbol]!;

      if (value >= divisor) {
        bool isExact = value % divisor == 0;
        return "${value ~/ divisor}$symbol${isExact ? '' : '+'}";
      }
    }

    return value.toString();
  }

  // getFormatedCoins() {
  //   int value = int.parse(this);

  //   if (value >= 1000) {
  //     if (value > 1000 && value < 2000) {
  //       return (value ~/ 1000).toString() + 'k';
  //     } else {
  //       return (value ~/ 1000).toString() + 'k+';
  //     }
  //   } else {
  //     return value.toString();
  //   }
  // }

  bool hasEarnedCoin() {
    int value = int.parse(this.isEmpty ? "0" : this);

    if (value == 0) {
      return false;
    } else {
      return true;
    }
  }

  String maskString(int unmaskedChars, String maskCharacter) {
    if (this.isEmpty || this.length <= unmaskedChars) {
      return this;
    }

    final maskedPart = substring(0, length - unmaskedChars)
        .replaceAll(RegExp(r'.'), maskCharacter);
    final unmaskedPart = substring(length - unmaskedChars);

    return maskedPart + unmaskedPart;
  }

  bool isNotEmptyandNotZero() {
    if (this.isNotEmpty && this.toString() != "0") {
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> getQueryParameters() {
    // Parse the link
    Uri uri = Uri.parse(this);

    // Extract parameters
    return uri.queryParameters;
  }

  Map<String, dynamic> getQueryParametersAsJson() {
    // Parse the link
    Uri uri = Uri.parse(this);

    // Extract parameters
    Map<String, List<String>> parameters = uri.queryParametersAll;

    // Convert parameters map to JSON
    Map<String, dynamic> jsonParams = {};
    parameters.forEach((key, value) {
      jsonParams[key] = value.length == 1 ? value.first : value;
    });

    return jsonParams;
  }

  String maskAfter(int charactersLimit) {
    if (length <= charactersLimit) {
      return this;
    } else {
      String mask = "";

      for (int i = 0; i < charactersLimit; i++) {
        mask += this[i];
      }

      return mask + "...";
    }
  }

  String? capitalizeFirstLetter() {
    if (this == null || this.isEmpty) {
      return this;
    }
    print("fsdfdsf $this");
    return this[0].toUpperCase() + this.substring(1);
  }

  String get firstName {
    List<String> nameParts = this.split(' ');
    return nameParts.isNotEmpty ? nameParts[0] : '';
  }

  String get lastName {
    List<String> nameParts = this.split(' ');
    return nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
  }

  String toMinutes() {
    int minutes =
        int.parse(this) ~/ 60; // Use integer division to get full minutes
    // Remainder gives the seconds part

    return '$minutes Min';
  }

  String convertSeconds() {
    if (int.parse(this) < 0) {
      return 'Invalid Time'; // Optional: handle negative values
    }

    int hours = int.parse(this) ~/
        3600; // Convert seconds to hours (1 hour = 3600 seconds)
    int minutes =
        (int.parse(this) % 3600) ~/ 60; // Convert remaining seconds to minutes
    int seconds = int.parse(this) % 60; // Remaining seconds after minutes

    if (hours > 0) {
      return '$hours Hr $minutes Min'; // Display hours, minutes, and seconds
    } else if (minutes > 0) {
      return '$minutes Min'; // If less than an hour, show minutes and seconds
    } else {
      return '$seconds Sec'; // If less than a minute, just show seconds
    }
  }
}
