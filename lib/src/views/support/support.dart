import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/widgets/custom_button.dart';
import 'package:quickly_delivery_man/src/widgets/custom_container.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';
import 'package:quickly_delivery_man/src/widgets/text_field.dart';

import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  int index = 1;
  bool check = false;
  TextEditingController msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    customImage(
                        kIconArrowBack, sw * 0.05, sw * 0.05, BoxFit.contain),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: CustomContainer(
                          marginright: 5,
                          paddingleft: 6,
                          paddingright: 6,
                          paddingbottom: 14,
                          paddingtop: 14,
                          child: Row(
                            children: [
                              customImage(kIconSupportColor, sw * 0.05,
                                  sw * 0.05, BoxFit.contain),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Support",
                                  style: ktextstyle.copyWith(fontSize: 12.sp))
                            ],
                          )),
                    ),
                    CustomContainer(
                        marginleft: 5,
                        marginright: 5,
                        paddingleft: 6,
                        paddingright: 6,
                        paddingbottom: 0,
                        paddingtop: 0,
                        child: Row(
                          children: [
                            customImage(kIconBadface, sw * 0.05, sw * 0.05,
                                BoxFit.contain),
                            SizedBox(
                              width: 10,
                            ),

                            DropdownButton(
                              dropdownColor: kcolorblack,
                              padding: EdgeInsets.all(0),
                              value: "one",
                              onChanged: (newValue) {
                                setState(() {});
                              },
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              icon: customImage(kIconDropdown, sw * 0.02,
                                  sw * 0.02, BoxFit.contain),
                              items: [
                                DropdownMenuItem(
                                    value: "one",
                                    child: Text(
                                      "Complaint 1 ",
                                      style:
                                          ktextstyle.copyWith(fontSize: 10.sp),
                                    )),
                                DropdownMenuItem(
                                    value: "two",
                                    child: Text(
                                      "Complaint 2 ",
                                      style:
                                          ktextstyle.copyWith(fontSize: 10.sp),
                                    )),
                                DropdownMenuItem(
                                    value: "three",
                                    child: Text(
                                      "conplaint 3 ",
                                      style:
                                          ktextstyle.copyWith(fontSize: 10.sp),
                                    ))
                              ],
                            ),
                            // Text("Complain",
                            //     style: ktextstyle.copyWith(fontSize: 10.sp)),
                            // SizedBox(
                            //   width: 5,
                            // ),
                            // customImage(kIconDropdown, 12, 12, BoxFit.contain),
                          ],
                        )),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: CustomContainer(
                        marginleft: 5,
                        marginright: 5,
                        paddingleft: 6,
                        paddingright: 6,
                        paddingbottom: 14,
                        paddingtop: 14,
                        child: customImage(
                            kIconPlus, sw * 0.05, sw * 0.05, BoxFit.contain),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      child: CustomContainer(
                        marginleft: 5,
                        marginright: 5,
                        paddingleft: 6,
                        paddingright: 6,
                        paddingbottom: 14,
                        paddingtop: 14,
                        child: customImage(
                            kIconSearch, sw * 0.05, sw * 0.05, BoxFit.contain),
                      ),
                    ),
                  ],
                ),
                if (index == 1) ...[
                  Column(
                    children: [
                      Column(
                        children: [
                          CustomContainer(
                              child: Text(
                            "05, NOv 2023",
                            style: ktextstyle.copyWith(fontSize: 12.sp),
                          )),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomContainer(
                                    child: Text(
                                  "hello sir how may help you?",
                                  style: ktextstyle.copyWith(fontSize: 12.sp),
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      customImage(kIconDoubletick, sw * 0.03,
                                          sw * 0.03, BoxFit.contain),
                                      customImage(kIconUser, sw * 0.03,
                                          sw * 0.03, BoxFit.contain),
                                      Text(
                                        "01:40 PM",
                                        style: ktextstyle.copyWith(
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomContainer(
                                    child: Text(
                                  "hello sir how may help you?",
                                  style: ktextstyle.copyWith(fontSize: 12.sp),
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      customImage(kIconDoubletick, sw * 0.03,
                                          sw * 0.03, BoxFit.contain),
                                      customImage(kIconUser, sw * 0.03,
                                          sw * 0.03, BoxFit.contain),
                                      Text(
                                        "01:40 PM",
                                        style: ktextstyle.copyWith(
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          alignmentsd(sw),
                          alignmentsd(sw),
                          alignmentsd(sw),
                          alignmentsd(sw),
                        ],
                      ),
                    ],
                  ),
                  Row(children: [
                    Expanded(
                      child: CustomContainer(
                          paddingbottom: 0,
                          paddingtop: 0,
                          child: CustomTextFeild(
                            controller: msgController,
                            prefixIcon: kIconSmile,
                            suffixIcon: kIconAttachment,
                          )),
                    ),
                    CustomContainer(
                      child: customImage(
                          kIconMic, sw * 0.05, sw * 0.1, BoxFit.contain),
                    )
                  ]),
                ] else if (index == 2) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomContainer(
                            child: Row(
                              children: [
                                customImage(kIconMessage, sw * 0.05, sw * 0.05,
                                    BoxFit.contain),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Complaint Type",
                                  style: ktextstyle.copyWith(fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          CustomContainer(
                            marginright: 5,
                            paddingleft: 6,
                            paddingright: 6,
                            paddingbottom: 0,
                            paddingtop: 0,
                            colorborder: false,
                            child: DropdownButton(
                              dropdownColor: kcolorblack,
                              padding: EdgeInsets.all(0),
                              value: "one",
                              onChanged: (newValue) {
                                setState(() {});
                              },
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              icon: customImage(kIconDropdown, sw * 0.02,
                                  sw * 0.02, BoxFit.contain),
                              items: [
                                DropdownMenuItem(
                                    value: "one",
                                    child: Text(
                                      "Refund ",
                                      style:
                                          ktextstyle.copyWith(fontSize: 10.sp),
                                    )),
                                DropdownMenuItem(
                                    value: "two",
                                    child: Text(
                                      "Refund 2 ",
                                      style:
                                          ktextstyle.copyWith(fontSize: 10.sp),
                                    )),
                                DropdownMenuItem(
                                    value: "three",
                                    child: Text(
                                      "Refund 3 ",
                                      style:
                                          ktextstyle.copyWith(fontSize: 10.sp),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomContainer(
                            child: Text(
                              "Subject",
                              style: ktextstyle.copyWith(fontSize: 12.sp),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.only(
                                    left: 10, bottom: 0, top: 0),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white.withOpacity(0.4),
                                          spreadRadius: 4,
                                          blurRadius: 5)
                                    ]),
                                child: CustomTextFeild(
                                  controller: msgController,
                                  labelText: "Type here",
                                )),
                          )
                        ],
                      ),
                      CustomContainer(
                        child: Text(
                          "Details",
                          style: ktextstyle.copyWith(fontSize: 12.sp),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.only(
                            top: 7, left: 5, right: 5, bottom: 0),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 5)
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                customImage(kIconAttachment, sw * 0.05,
                                    sw * 0.05, BoxFit.contain),
                                SizedBox(
                                  width: 10,
                                ),
                                customImage(kIconCamera, sw * 0.05, sw * 0.05,
                                    BoxFit.contain),
                                SizedBox(
                                  width: 10,
                                ),
                                customImage(kIconMic, sw * 0.05, sw * 0.05,
                                    BoxFit.contain),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            CustomTextFeild(
                              controller: msgController,
                              maxlines: 3,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(width: sw * 0.3, text: "GO"),
                          CustomButton(
                              color: false, width: sw * 0.3, text: "Cancel")
                        ],
                      )
                    ],
                  )
                ] else if (index == 3) ...[
                  InkWell(
                    onTap: () {
                      setState(() {
                        check = true;
                      });
                    },
                    child: CustomContainer(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add New Payment method",
                                    style: ktextstyle.copyWith(fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      customImage(kIconMessage, sw * 0.05,
                                          sw * 0.05, BoxFit.contain),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "suggest to Add New Payment Method. Its Easy to use Please Contact me",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: ktextstyle.copyWith(
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "#348957",
                                      style:
                                          ktextstyle.copyWith(fontSize: 12.sp),
                                    ),
                                    Text(
                                      "04:00 PM",
                                      style:
                                          ktextstyle.copyWith(fontSize: 12.sp),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "2 Dec 2024",
                                      style:
                                          ktextstyle.copyWith(fontSize: 12.sp),
                                    ),
                                    Text(
                                      "Suggest",
                                      style:
                                          ktextstyle.copyWith(fontSize: 12.sp),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Thank you very much Mr. Mustafa for you suggest Quickly are Promise you work.",
                          textAlign: TextAlign.center,
                          style: ktextstyle.copyWith(fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "solved",
                                style: ktextstyle.copyWith(
                                    fontSize: 12.sp,
                                    color:
                                        const Color.fromARGB(255, 86, 253, 92)),
                              ),
                              Text(
                                "04:00 PM",
                                style: ktextstyle.copyWith(fontSize: 12.sp),
                              ),
                              Text(
                                "2 Dec 2024",
                                style: ktextstyle.copyWith(fontSize: 12.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                  ),
                  if (check == true) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomContainer(
                            child: Text(
                          "Details",
                          style: ktextstyle.copyWith(fontSize: 12.sp),
                        )),
                        CustomContainer(
                            child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                customImage(kIconAttachment, sw * 0.05,
                                    sw * 0.05, BoxFit.contain),
                                SizedBox(
                                  width: 5,
                                ),
                                customImage(kIconCamera, sw * 0.05, sw * 0.05,
                                    BoxFit.contain),
                                SizedBox(
                                  width: 5,
                                ),
                                customImage(kIconMic, sw * 0.05, sw * 0.05,
                                    BoxFit.contain),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            // Align(
                            //   alignment: Alignment.bottomLeft,
                            //   child: Text(
                            //     "Type Here",
                            //     style: ktextstyle.copyWith(fontSize: 12.sp),
                            //   ),
                            // )
                            CustomTextFeild(
                              controller: msgController,
                              maxlines: 4,
                              labelText: "Type here",
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(width: sw * 0.3, text: "reply"),
                            CustomButton(
                                color: false, width: sw * 0.3, text: "Cancel")
                          ],
                        )
                      ],
                    )
                  ],
                ]
              ],
            ),
          ),
        ));
  }

  Widget alignmentsd(sw) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
              child: Text(
            "hello sir how may help you?",
            style: ktextstyle.copyWith(fontSize: 12.sp),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                customImage(
                    kIconDoubletick, sw * 0.03, sw * 0.03, BoxFit.contain),
                customImage(kIconUser, sw * 0.03, sw * 0.03, BoxFit.contain),
                Text(
                  "01:40 PM",
                  style: ktextstyle.copyWith(fontSize: 12.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
