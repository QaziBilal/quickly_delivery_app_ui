import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/utils/images.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';
import 'package:quickly_delivery_man/src/widgets/custom_button.dart';
import 'package:quickly_delivery_man/src/widgets/custom_container.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';
import 'package:quickly_delivery_man/src/widgets/perosnal_info_widgets.dart';

class DeliveryManScreen extends StatefulWidget {
  const DeliveryManScreen({super.key});

  @override
  State<DeliveryManScreen> createState() => _DeliveryManScreenState();
}

class _DeliveryManScreenState extends State<DeliveryManScreen> {
  int button = 1;
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: customImage(klogo, 200, 100, BoxFit.contain)),
          Row(
            children: [
              customImage(kIconArrowBack, 20, 20, BoxFit.contain),
              CustomContainer(
                  child: Row(
                children: [
                  customImage(kIconFoodDelivery, 30, 30, BoxFit.fill),
                  Text(
                    "Join As Delivery",
                    style: ktextstyle.copyWith(fontSize: 14),
                  ),
                ],
              )),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              container(kIconUser, "Personal Info", 1, sw),
              container(kIconCar, "Vehicle Info", 2, sw),
              container(kIconDescription, "Doc Copy", 3, sw),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          if (button == 1) ...[
            personalInfo(sw)
          ] else if (button == 2) ...[
            vechileInfo()
          ] else ...[
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: docList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 50),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            customImage(kIconSearch, 20, 20, BoxFit.contain),
                            SizedBox(
                              width: 10,
                            ),
                            customImage(kIconCamera, 20, 20, BoxFit.contain)
                          ],
                        ),
                        Text(
                          docList[index],
                          style: ktextstyle.copyWith(fontSize: 13.sp),
                        ),
                      ],
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(width: 100, text: "SAVE"),
                CustomButton(color: false, width: 100, text: "CANCEL"),
              ],
            )
          ]
        ],
      )),
    );
  }

  List docList = [
    "Nattional ID Copy",
    "Vehicle License Copy",
    "Driver License Copy",
    "Vehicle Front Picture",
    "Vehicle Back Picture",
    "Vehicle Right Picture",
    "Vehicle Left Picture",
  ];

  Widget container(image, title, number, sw) {
    return InkWell(
      onTap: () {
        setState(() {
          button = number;
        });
      },
      child: CustomContainer(
          child: Column(
        children: [
          customImage(image, sw * 0.1, sw * 0.1, BoxFit.contain),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: ktextstyle.copyWith(fontSize: 12),
          )
        ],
      )),
    );
  }

  Widget personalInfo(sw) {
    return Column(
      children: [
        CustomContainer(
            marginleft: sw * 0.3,
            marginright: sw * 0.3,
            child: Column(
              children: [
                customImage(kprofile, 110, 110, BoxFit.contain),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    customImage(kIconSearch, 20, 20, BoxFit.contain),
                    SizedBox(
                      width: 10,
                    ),
                    customImage(kIconCamera, 20, 20, BoxFit.contain)
                  ],
                ),
              ],
            )),
        Text(
          "Upload Profile Picture",
          style: ktextstyle.copyWith(fontSize: 14),
        ),
        SizedBox(
          height: 20,
        ),
        designContainer(iconprefix: kIconUser, title: "Full Name"),
        designContainer(child: true),
        designContainer(iconprefix: kIconBadreview, title: "Birthdate"),
        designContainer(iconprefix: kIconUser, title: "Nationality"),
        designContainer(
            iconprefix: kIconHome, title: "Address", suffixicon: "hello"),
        designContainer(iconprefix: kIconMobile1, title: "Mobile Number 1"),
        designContainer(iconprefix: kIconMobile2, title: "Mobile Number 2"),
        designContainer(iconprefix: kIconMessage, title: "Email"),
        designContainer(iconprefix: kIconNameCard, title: "National ID")
      ],
    );
  }

  Widget vechileInfo() {
    return Column(
      children: [
        designContainer(iconprefix: kIconCar, title: "Vehicle Type"),
      ],
    );
  }
}
