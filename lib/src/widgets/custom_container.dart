import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:quickly_delivery_man/src/utils/colors.dart';

class CustomContainer extends StatelessWidget {
  double paddingtop;
  double paddingbottom;
  double paddingleft;
  double paddingright;
  double margintop;
  double marginbottom;
  double marginleft;
  double marginright;
  Widget child;
  bool colorborder;
  double borderRadius;
  CustomContainer(
      {this.paddingtop = 10,
      this.paddingbottom = 10,
      this.paddingleft = 15,
      this.paddingright = 15,
      this.margintop = 5,
      this.marginbottom = 5,
      this.marginleft = 10,
      this.marginright = 10,
      required this.child,
      this.borderRadius = 7,
      this.colorborder = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: paddingtop,
          bottom: paddingbottom,
          left: paddingleft,
          right: paddingright),
      margin: EdgeInsets.only(
          top: margintop,
          bottom: marginbottom,
          left: marginleft,
          right: marginright),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 5)
          ],
          border: colorborder == true
              ? GradientBoxBorder(
                  gradient: LinearGradient(
                      colors: [kcolorpurple, kcolorblue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight))
              : Border.all(color: Colors.black)),
      child: child,
    );
  }
}
