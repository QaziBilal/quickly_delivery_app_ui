import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';

import '../utils/icons.dart';
import '../utils/images.dart';
import 'custom_button.dart';
import 'custom_container.dart';

Widget containerDetails(context, {bool details = false, bool button = false}) {
  double sw = MediaQuery.sizeOf(context).width;
  return CustomContainer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: customImage(kbanner, sw * 0.15, sw * 0.15, BoxFit.fill)),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget("Valentino's Pasta", 16),
                textWidget("2 Pasta with Cheese", 12),
                textWidget("1 pasta Without Cheese", 12),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                textWidget("7 Mins", 12),
                textWidget("04:12 PM", 12),
                textWidget("2 Dec 2024", 12),
                textWidget("30/Le", 12),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  customImage(kIconIosPin, 20, 20, BoxFit.contain),
                  textWidget("Driver Maadi", 11),
                ],
              ),
            ),
            dottedLine(),
            Column(
              children: [textWidget("0.15 KM", 11), textWidget("1 Min", 11)],
            ),
            dottedLine(),
            Expanded(
              child: Column(
                children: [
                  customImage(kIconIosPin, 20, 20, BoxFit.contain),
                  textWidget("Driver Maadi", 11),
                ],
              ),
            ),
            dottedLine(),
            Column(
              children: [textWidget("15 KM", 11), textWidget("11 Min", 11)],
            ),
            dottedLine(),
            Expanded(
              child: Column(
                children: [
                  customImage(kIconIosPin, 20, 20, BoxFit.contain),
                  textWidget("Drop off Nasr City", 11),
                ],
              ),
            ),
          ],
        ),
        if (details == true) ...[
          const Padding(
            padding: EdgeInsets.only(right: 18),
            child: DottedLine(
              direction: Axis.vertical,
              lineLength: 70,
              dashColor: Colors.white,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  customImage(kIconIosPin, 20, 20, BoxFit.contain),
                  textWidget("Pick up Nasr City", 11),
                ],
              ),
              dottedLine(),
              Column(
                children: [textWidget("15 KM", 11), textWidget("19 Min", 11)],
              ),
              dottedLine(),
              Expanded(
                child: Column(
                  children: [
                    customImage(kIconIosPin, 20, 20, BoxFit.contain),
                    textWidget("Drop off Near City", 11),
                  ],
                ),
              ),
            ],
          ),
        ],
        const SizedBox(
          height: 10,
        ),
        if (button == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  customImage(kIconCar, 100, 30, BoxFit.contain),
                  Text("First Class",
                      style: ktextstyle.copyWith(fontSize: 10.sp)),
                ],
              ),
              Text(
                "Toyota Corolla 2010 White 762",
                style: ktextstyle.copyWith(fontSize: 13.sp),
              ),
            ],
          ),
        const SizedBox(
          height: 10,
        ),
        if (button == true)
          CustomContainer(
            marginleft: sw * 0.25,
            marginright: sw * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customImage(kIconMapFind, 20, 20, BoxFit.contain),
                Text("FIND", style: ktextstyle.copyWith(fontSize: 13)),
              ],
            ),
          ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget("Request Type:   Shipping", 11),
                textWidget("Vehicle Type:   Any", 11),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget("Request Type:   Shipping", 11),
                textWidget("Duration:   20 Minutes", 11),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        if (button == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(width: 100, text: "ACCEPT"),
              SizedBox(
                width: 15,
              ),
              CustomButton(color: false, width: 100, text: "REJECT"),
            ],
          ),
      ],
    ),
  );
}

Widget customRow1(icon, title) {
  return CustomContainer(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customImage(icon, 20, 20, BoxFit.contain),
        Text(
          title,
          style: ktextstyle.copyWith(fontSize: 12.sp),
        ),
      ],
    ),
  );
}

Widget textWidget(text, double size) {
  return Text(
    text,
    style: ktextstyle.copyWith(
      fontSize: size.sp,
    ),
    textAlign: TextAlign.center,
    maxLines: 2,
  );
}

Widget dottedLine() {
  return const Expanded(
    child: DottedLine(
      dashColor: Colors.white,
    ),
  );
}
