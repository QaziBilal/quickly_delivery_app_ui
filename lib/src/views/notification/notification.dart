import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/colors.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/utils/images.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';
import 'package:quickly_delivery_man/src/widgets/custom_container.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';

class Notificationscreen extends StatelessWidget {
  const Notificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: kcolorblack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            CustomContainer(
                marginright: sw * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customImage(kIconNotificationsActive, sw * 0.05, sw * 0.05,
                        BoxFit.contain),
                    Text(
                      "Notifications",
                      style: ktextstyle.copyWith(fontSize: 14.sp),
                    ),
                  ],
                )),
            CustomContainer(
                child: Text(
              "TODAY",
              style: ktextstyle.copyWith(fontSize: 10.sp),
            )),
            customNotification(sw),
            customNotification(sw),
            CustomContainer(
                child: Text(
              "Older",
              style: ktextstyle.copyWith(fontSize: 10.sp),
            )),
            customNotification(sw),
            CustomContainer(
                child: Text(
              "Older",
              style: ktextstyle.copyWith(fontSize: 10.sp),
            )),
            customNotification(sw)
          ],
        ),
      ),
    );
  }

  Widget customNotification(sw) {
    return CustomContainer(
        child: Row(
      children: [
        Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: customImage(kimage, sw * 0.15, sw * 0.15, BoxFit.fill)),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LOrem Ipsum",
              style: ktextstyle.copyWith(fontSize: 14.sp),
            ),
            Text(
              "5 mni",
              style: ktextstyle.copyWith(fontSize: 14.sp),
            ),
          ],
        )
      ],
    ));
  }
}
