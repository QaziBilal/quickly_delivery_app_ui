import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/colors.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';

import '../utils/icons.dart';
import 'custom_container.dart';

Widget socialMediaBottomLogin(sw, sh) {
  return CustomContainer(
      marginleft: 0,
      marginright: 0,
      marginbottom: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          socialSingle(sw, sh, kIconFacebook, "FACEBOOK"),
          VerticalDivider(
            color: kcolorwhite,
            width: 12,
          ),
          socialSingle(sw, sh, kIconGoogle, "GOOGLE"),
        ],
      ));
}

Widget socialSingle(sw, sh, image, text) {
  return Expanded(
    child: Column(
      children: [
        Image.asset(
          image,
          width: sw <= 450 ? sw * 0.1 : sw * 0.05,
          height: sw <= 450 ? sw * 0.1 : sw * 0.05,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "LOGIN WITH $text",
          style: ktextstyle.copyWith(letterSpacing: 0.6, fontSize: 10.sp),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
