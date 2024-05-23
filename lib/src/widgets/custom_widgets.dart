import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';

Widget customText(String text, {double size = 10}) {
  return Text(
    text,
    style: ktextstyle.copyWith(fontSize: size.sp, fontWeight: FontWeight.w200),
  );
}

Widget kSizedboxWidth({required double width}) {
  return SizedBox(
    width: width,
  );
}

Widget kSizedboxheight({required double height}) {
  return SizedBox(
    height: height,
  );
}
