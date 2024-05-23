import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/text_style.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/text_field.dart';

class SetLocationScreen extends StatelessWidget {
  SetLocationScreen({super.key});
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorblack,
      appBar: CustomAppBar(title: "Set your Work Location", context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
          child: Column(
            children: [
              CustomContainer(
                  child: CustomTextFeild(
                controller: _controller,
                suffixIcon: kIconMic,
              )),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      customImage(kIconMap1, 30, 30, BoxFit.contain),
                      SizedBox(width: 10),
                      Text("Choose on Map",
                          style: ktextstyle.copyWith(fontSize: 14.sp)),
                    ],
                  ),
                  CustomContainer(
                    child: Row(
                      children: [
                        customImage(kIconCursorHand, 30, 30, BoxFit.contain),
                        SizedBox(width: 10),
                        Text("Map",
                            style: ktextstyle.copyWith(fontSize: 14.sp)),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
