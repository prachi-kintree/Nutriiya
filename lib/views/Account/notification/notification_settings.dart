import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/views/Account/notification/selected_mode_settings.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';

import '../widgets/custom_list_tile.dart';
import 'email/email_verification.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'Whatsapp', 'icon': svgWhatsapp, 'screen': const SelectedModeSettings(title: "Whatsapp")},
      {'label': 'Email', 'icon': svgGmail, 'screen': const EmailRegistration()},
      {'label': 'SMS', 'icon': svgSms, 'screen': const SelectedModeSettings(title: "SMS")}, // Replace with SMS screen
    ];

    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: "Notifications"),
      body: Stack(
        children: [
          const CommonGradient(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
            child: Column(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CustomListTile(
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => item['screen'] as Widget),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          leading: SvgPicture.asset(item['icon'].toString(), width: 20.h),
                          title: Text(item['label'].toString()),
                          trailing: const Icon(Icons.chevron_right),
                        )
                    ),



                );
              }).toList(),
            ),
          ),
        ],
      )
    );
  }
}
