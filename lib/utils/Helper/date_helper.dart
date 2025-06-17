import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateHelper {
  Future<DateTime?> showPlatformDatePicker(BuildContext context) async {
    DateTime? selectedDate;
    if (Platform.isIOS) {
      final DateTime? picked = await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: 220.0,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        child: Text('Done'),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    minimumDate: DateTime.now(),
                    onDateTimeChanged: (DateTime newDate) {
                      print(selectedDate);
                      selectedDate = newDate;
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
      if (picked != null) {
        selectedDate = picked;
      }
      return selectedDate ?? DateTime.now();
    } else {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        cancelText: "Cancel",
        confirmText: "OK",
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xFF943F7F), // <-- SEE HERE
                onPrimary: Color.fromARGB(255, 255, 255, 255), // <-- SEE HERE
                onSurface: Color(0xFF000000), // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFFFFFFFF),
                  // textStyle: TextStyle(decorationColor: Color(0xFFFFFFFF)),
                  backgroundColor: Color(0xFF943F7F), // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        selectedDate = picked;
      }
      return picked ?? DateTime.now();
    }
  }

  Future<DateTime?> showPlatformTimePicker(BuildContext context) async {
    DateTime? selectedDate;
    if (Platform.isIOS) {
      final DateTime? picked = await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: 220.0,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        child: Text('Done'),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (DateTime newDate) {
                      selectedDate = newDate;
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
      if (picked != null) {
        selectedDate = picked;
      }
      return selectedDate ?? DateTime.now();
    } else {
      final TimeOfDay? picked = await showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
        initialEntryMode: TimePickerEntryMode.inputOnly,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xFF943F7F), // <-- SEE HERE
                onPrimary: Color.fromARGB(255, 255, 255, 255), // <-- SEE HERE
                onSurface: Color(0xFF000000), // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFFFFFFFF),

                  backgroundColor: Color(0xFF943F7F), // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null && picked != selectedDate) {
        selectedDate = convertToDateTime(picked);
      }
      return selectedDate ?? convertToDateTime(TimeOfDay.now());
    }
  }

  DateTime convertToDateTime(TimeOfDay selectedTime) {
    DateTime currentDate = DateTime.now();
    DateTime selectedDateTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    return selectedDateTime;
  }
}
