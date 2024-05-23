import 'package:flutter/material.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/widgets/custom_container.dart';

import '../utils/text_style.dart';
import 'custom_image.dart';

Widget designContainer({iconprefix, title, suffixicon = "", child = false}) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
    margin: EdgeInsets.only(left: 25, right: 25, bottom: 20),
    decoration: BoxDecoration(
      color: Colors.black,
      boxShadow: [
        BoxShadow(
            blurRadius: 5,
            spreadRadius: 5,
            color: Colors.white.withOpacity(0.2)),
      ],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        if (child == false) ...[
          customImage(iconprefix, 25, 25, BoxFit.contain),
          SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: ktextstyle.copyWith(fontSize: 13),
          ),
          if (suffixicon != "") ...[
            Spacer(),
            customImage(kIconIosPin, 15, 25, BoxFit.contain)
          ]
        ] else ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customImage(kIconHourglass, 25, 25, BoxFit.contain),
              Row(
                children: [
                  CustomContainer(child: Text("")),
                  customImage(kIconFemale, 25, 25, BoxFit.contain),
                  Text("Male")
                ],
              ),
              Row(
                children: [
                  CustomContainer(child: Text("")),
                  customImage(kIconFemale, 25, 25, BoxFit.contain),
                  Text("Male")
                ],
              ),
            ],
          )
        ]
      ],
    ),
  );
}
