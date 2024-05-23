import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:quickly_delivery_man/src/utils/colors.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  double width;
  double paddingtop;
  double paddingbottom;
  double paddingleft;
  double paddingright;
  String text;
  bool color;
  CustomButton({
    this.paddingtop = 10,
    this.paddingbottom = 10,
    this.paddingleft = 0,
    this.paddingright = 0,
    required this.width,
    required this.text,
    this.color = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: null,
      padding: EdgeInsets.only(
          top: paddingtop, bottom: paddingbottom, left: 10, right: 10),
      decoration: BoxDecoration(
        border: GradientBoxBorder(
            gradient: LinearGradient(
          colors: [kcolorblue, kcolorpurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        gradient: color == true
            ? LinearGradient(
                colors: [kcolorpurple, kcolorblue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [kcolorblack, kcolorblack],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "    $text    ",
        style:
            ktextstyle.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
