import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/colors.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/widgets/custom_button.dart';
import 'package:quickly_delivery_man/src/widgets/custom_container.dart';

class PopupCard extends StatelessWidget {
  final Widget content;

  bool isbuttons;
  bool textSentences;
  Widget? child;
  String text;
  String buttonText1;
  String buttonText2;
  String icon;
  double width;
  double height;
  final Function? onbutton1;
  final Function? onbutton2;
  bool scrollable1;

  PopupCard(
      {super.key,
      required this.content,
      this.scrollable1 = false,
      required this.width,
      required this.height,
      required this.icon,
      this.child,
      this.textSentences = false,
      this.isbuttons = false,
      this.text = "",
      this.buttonText1 = "",
      this.buttonText2 = "",
      this.onbutton1,
      this.onbutton2});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      backgroundColor: kcolorblack,
      scrollable: scrollable1,
      content: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 8)
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContainer(
              child: Image.asset(
                icon,
                width: 35,
                height: 35,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            textSentences == true
                ? Text(text)
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: content,
                  ),
            SizedBox(
              height: 20,
            ),
            if (isbuttons == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      onbutton1!();
                    },
                    child: CustomButton(
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        text: buttonText1),
                  ),
                  InkWell(
                    onTap: () {
                      onbutton2!();
                    },
                    child: CustomButton(
                        color: false,
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        text: buttonText2),
                  ),
                ],
              )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.all(10.sp),
    );
  }
}
