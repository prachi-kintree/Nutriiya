import 'package:flutter/material.dart';
import 'package:nutriya/views/Account/notification/selected_mode_settings.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';

import '../../../../RouteManager/navigator_service.dart';
import '../../../Onboarding/login/otp/otp_screen.dart';

class OtpEmailVerification extends StatelessWidget {
  const OtpEmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: ""),

        body: Stack(
          children: [
            CommonGradient(),
            OtpWidget(contact: "rajshah@gmail.com",
                forEmail: true,
                onTapNext: () {
                  appNavigator.push(MaterialPageRoute(builder: (context) => SelectedModeSettings(title: "Email")));
                }),
          ],
        ));
  }
}
