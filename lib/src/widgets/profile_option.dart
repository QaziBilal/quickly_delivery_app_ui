import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';

import '../utils/icons.dart';
import '../utils/text_style.dart';
import 'custom_container.dart';

Widget options(image, text, suffix, textCheck, sw, {suffixText = ""}) {
  return CustomContainer(
      colorborder: false,
      marginbottom: 15,
      child: Row(
        children: [
          customImage(image, sw * 0.05, sw * 0.05, BoxFit.contain),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: ktextstyle.copyWith(fontSize: 12.sp),
          ),
          Spacer(),
          if (suffix == true) ...[
            if (textCheck == true) ...[
              Text(
                suffixText,
                style: ktextstyle.copyWith(fontSize: 12.sp),
              )
            ] else ...[
              Row(
                children: [
                  Text(
                    suffixText,
                    style: ktextstyle.copyWith(fontSize: 12.sp),
                  ),
                  customImage(
                      kIconArrowForward, sw * 0.05, sw * 0.05, BoxFit.contain)
                ],
              )
            ]
          ]
        ],
      ));
}

Widget settingOptions(text, sw) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
    margin: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
    decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.4),
              blurRadius: 5,
              spreadRadius: 2)
        ],
        borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        Text(
          text,
          style: ktextstyle.copyWith(fontSize: 14.sp),
        ),
        Spacer(),
        customImage(kIconArrowForward, sw * 0.05, sw * 0.05, BoxFit.contain)
      ],
    ),
  );
}
