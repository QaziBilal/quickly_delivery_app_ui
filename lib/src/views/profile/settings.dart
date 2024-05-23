import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';
import 'package:quickly_delivery_man/src/views/main_page.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';
import 'package:quickly_delivery_man/src/widgets/profile_option.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Setting",
          style: ktextstyle.copyWith(fontSize: 14.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: customImage(kIconArrowBack, 15, 15, BoxFit.contain)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "General Settings",
              style: ktextstyle.copyWith(fontSize: 16.sp),
            ),
            SizedBox(
              height: 20,
            ),
            settingOptions("Notification Tone", sw),
            settingOptions("My Filed Complaints", sw),
            settingOptions("Edit Profile", sw),
            settingOptions("Langiuage Settings", sw),
            settingOptions("Terms of Service", sw),
            settingOptions("Privacy Policy", sw),
            settingOptions("Rate This App", sw)
          ],
        ),
      ),
    );
  }
}
