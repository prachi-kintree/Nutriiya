import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/translation/locale_keys.g.dart';
import 'package:nutriya/utils/CustomWidgets/Button/custom_resend_otp.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../theme/theme_model.dart';

// class ResendOtpButton extends StatelessWidget {
//   VoidCallback onPressed;
//   ResendOtpButton({required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return OtpTimerButton(
//       backgroundColor: Colors.transparent,
//       loadingIndicatorColor: Colors.transparent,
//       buttonType: ButtonType.text_button,
//       onPressed: onPressed,
//       text: Text(
//         LocaleKeys.resend_code.tr(),
//         style: AppTextStyle.jakartaStyle(
//             withTextStyle: TextStyle(
//                 color: ThemeManagerPlus.of<AppTheme>(context)
//                     .currentTheme
//                     .primaryGreen,
//                 decoration: TextDecoration.underline,
//                 fontSize: 14.sp),
//             jakartaFont: JakartaStyle.semibold),
//       ),
//       duration: 30,
//     );
//   }
// }


// class ResendOtpButton extends StatefulWidget {
//   final VoidCallback onPressed;
//
//   const ResendOtpButton({Key? key, required this.onPressed}) : super(key: key);
//
//   @override
//   State<ResendOtpButton> createState() => _ResendOtpButtonState();
// }
//
// class _ResendOtpButtonState extends State<ResendOtpButton> {
//   Timer? _timer;
//   int _counter = 0;
//   bool isCounting = true;
//
//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }
//
//   void startTimer() {
//     setState(() {
//       _counter = 30;
//       isCounting = true;
//     });
//
//     _timer?.cancel();
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_counter == 0) {
//         setState(() {
//           isCounting = false;
//         });
//         timer.cancel();
//       } else {
//         setState(() {
//           _counter--;
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(children: [
//         TextSpan(
//           text: "Didn’t get the code? " + ' ', // “Didn’t get the code?”
//           style: AppTextStyle.outfitStyle(
//             withTextStyle: TextStyle(
//               fontSize: 15.sp,
//               color: ThemeManagerPlus.of<AppTheme>(context)
//                   .currentTheme
//                   .subtitleGrey,
//             ),
//             outfitFont: OutfitFontStyle.regular,
//           ),
//         ),
//         TextSpan(
//           text: isCounting
//               ? '(${LocaleKeys.in_seconds.tr(namedArgs: {'sec': _counter.toString()})})'
//               : '[${LocaleKeys.resend_code.tr()}]', // [Resend]
//           style: AppTextStyle.outfitStyle(
//             withTextStyle: TextStyle(
//               fontSize: 15.sp,
//               color: ThemeManagerPlus.of<AppTheme>(context)
//                   .currentTheme
//                   .primaryGreen,
//               decoration: isCounting ? null : TextDecoration.underline,
//             ),
//             outfitFont: OutfitFontStyle.medium,
//           ),
//           recognizer: isCounting
//               ? null
//               : (TapGestureRecognizer()
//             ..onTap = () {
//               widget.onPressed();
//               startTimer(); // restart the timer
//             }),
//         ),
//       ]),
//     );
//   }
// }


class ResendOtpText extends StatefulWidget {
  final VoidCallback onResend;

  const ResendOtpText({required this.onResend, Key? key}) : super(key: key);

  @override
  State<ResendOtpText> createState() => _ResendOtpTextState();
}

class _ResendOtpTextState extends State<ResendOtpText> {
  Timer? _timer;
  int _secondsRemaining = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _canResend = false;
      _secondsRemaining = 30;
    });

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        setState(() {
          _canResend = true;
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _handleResend() {
    widget.onResend();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeManagerPlus.of<AppTheme>(context).currentTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!_canResend)
          RichText(text: TextSpan(
            children: [
              TextSpan(text: '${LocaleKeys.resend_code.tr()} in ',style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(
                  fontSize: 15.sp,
                  color: theme.subtitleGrey,
                ),
                outfitFont: OutfitFontStyle.regular,
              )),
              TextSpan(text: '$_secondsRemaining sec', style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(
                  fontSize: 15.sp,
                  color: theme.secondaryOrange,
                ),
                outfitFont: OutfitFontStyle.bold,
              )),

            ]
          ))

          // Text(
          //   '${LocaleKeys.resend_code.tr()} in $_secondsRemaining sec',
          //   style: AppTextStyle.outfitStyle(
          //     withTextStyle: TextStyle(
          //       fontSize: 15.sp,
          //       color: theme.subtitleGrey,
          //     ),
          //     outfitFont: OutfitFontStyle.regular,
          //   ),
          // )
        else
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: "Didn’t get the code? ",
                style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                    fontSize: 15.sp,
                    color: theme.subtitleGrey,
                  ),
                  outfitFont: OutfitFontStyle.regular,
                ),
              ),
              TextSpan(
                text: "Resend",
                style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                    fontSize: 15.sp,
                    color: theme.primaryGreen,
                    decoration: TextDecoration.underline,
                  ),
                  outfitFont: OutfitFontStyle.medium,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = _handleResend,
              ),
            ]),
          ),
      ],
    );
  }
}
