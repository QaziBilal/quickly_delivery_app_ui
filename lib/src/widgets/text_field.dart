import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';

class CustomTextFeild extends StatelessWidget {
  String prefixIcon;
  String suffixIcon;
  TextEditingController controller;
  String labelText;
  bool obscureText;
  double width;
  double height;
  var maxlines;
  final Function? ontap;

  CustomTextFeild(
      {this.prefixIcon = "",
      this.labelText = "",
      required this.controller,
      this.suffixIcon = "",
      this.obscureText = false,
      this.width = 20,
      this.height = 20,
      this.maxlines = 1,
      this.ontap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: ktextstyle.copyWith(fontSize: 16.sp),
      onTap: () {
        ontap!();
      },
      maxLines: maxlines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        border: InputBorder.none,
        hintText: " Type Here",
        hintStyle: ktextstyle.copyWith(fontSize: 16.sp),
        labelStyle: ktextstyle.copyWith(fontSize: 16.sp),
        prefixIconConstraints: BoxConstraints(
            maxHeight: 40, maxWidth: 40, minHeight: 25, minWidth: 25),
        prefixIcon: prefixIcon == ""
            ? null
            : Container(
                margin: EdgeInsets.only(right: 5),
                child: customImage(prefixIcon, width, height, BoxFit.contain)),
        suffixIconConstraints: BoxConstraints(
            maxHeight: 30, maxWidth: 30, minHeight: 20, minWidth: 20),
        suffixIcon: suffixIcon == ""
            ? null
            : customImage(suffixIcon, width, height, BoxFit.contain),
      ),
      obscureText: obscureText,
    );
  }
}
