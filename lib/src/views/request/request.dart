import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:quickly_delivery_man/src/utils/colors.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/utils/images.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';
import 'package:quickly_delivery_man/src/widgets/container_details.dart';
import 'package:quickly_delivery_man/src/widgets/custom_button.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';
import 'package:quickly_delivery_man/src/widgets/dialog_box.dart';
import 'package:quickly_delivery_man/src/widgets/text_field.dart';

import '../../widgets/custom_container.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  int button = 1;
  bool offline = false;

  Timer? _timer;
  TextEditingController typemsgController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    if (button == 3) {
      _timer = Timer(Duration(seconds: 5), () {
        setState(() {
          button = 4;
        });
      });
    }
  }

  void startTime2() {
    if (button == 2) {
      _timer = Timer(Duration(seconds: 5), () {
        setState(() {
          button = 3;
          Navigator.pop(context);
          startTimer();
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;
    void startTime1() {
      _timer = Timer(Duration(seconds: 5), () {
        setState(() {
          startTime2();
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return PopupCard(
                    content: Column(
                      children: [
                        Text(
                          "Your offer has been Accepted",
                          style: ktextstyle.copyWith(fontSize: 12.sp),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Must Take the permission to cancel the offer",
                          style: ktextstyle.copyWith(fontSize: 12.sp),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    width: sw * 0.9,
                    height: sh * 0.2,
                    icon: kIconThanks);
              });
        });
      });
    }

    if (button == 1) {
      return Scaffold(
        backgroundColor: kcolorblack,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      paddingleft: 8,
                      paddingright: 8,
                      marginright: 2,
                      child: Row(
                        children: [
                          customImage(kIconInterviewColor, sw * 0.05, sw * 0.05,
                              BoxFit.contain),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Customer Requests",
                            style: ktextstyle.copyWith(fontSize: 13.sp),
                          )
                        ],
                      ),
                    ),
                    if (offline == false)
                      CustomContainer(
                          paddingleft: 8,
                          paddingright: 8,
                          marginright: 5,
                          marginleft: 4,
                          child: customImage(kIconSortAlphaDown, sw * 0.05,
                              sw * 0.05, BoxFit.contain)),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return PopupCard(
                                      isbuttons: true,
                                      buttonText1: "ONLINE",
                                      buttonText2: "OFFLINE",
                                      onbutton1: () {
                                        Navigator.pop(context);
                                      },
                                      onbutton2: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          offline = true;
                                        });
                                      },
                                      content: Text(
                                        "You are stop the requests offline",
                                        style: ktextstyle.copyWith(
                                            fontSize: 12.sp),
                                      ),
                                      width: sw * 0.9,
                                      height: sh * 0.2,
                                      icon: kIconNoWifi);
                                });
                          },
                          child: CustomButton(
                              width: sw * 0.3, text: "GO OFFLINE")),
                    )
                  ],
                ),
                if (offline == false) ...[
                  Row(
                    children: [
                      customContainerRequest("Priority", check: true),
                      SizedBox(
                        width: 10,
                      ),
                      customContainerRequest("Request Duration From"),
                    ],
                  ),
                  Row(
                    children: [
                      customContainerRequest("Vehicle Type", check: true),
                      SizedBox(
                        width: 10,
                      ),
                      customContainerRequest("Request Duration to"),
                    ],
                  ),
                  Row(
                    children: [
                      customContainerRequest("request Type", check: true),
                      SizedBox(
                        width: 10,
                      ),
                      customContainerRequest("Pickup Distance From"),
                    ],
                  ),
                  Row(
                    children: [
                      customContainerRequest("Sort by", check: true),
                      SizedBox(
                        width: 10,
                      ),
                      customContainerRequest("Pickup Distance To"),
                    ],
                  ),
                  Row(
                    children: [
                      customContainerRequest("Distance From Drop Off"),
                      SizedBox(
                        width: 10,
                      ),
                      customContainerRequest("Cost From"),
                    ],
                  ),
                  Row(
                    children: [
                      customContainerRequest("Distance To Drop Off"),
                      SizedBox(
                        width: 10,
                      ),
                      customContainerRequest("Cost From"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          button = 2;
                        });
                      },
                      child: containerDetails(context)),
                  containerDetails(context),
                  containerDetails(context),
                ] else ...[
                  SizedBox(
                    height: 100,
                  ),
                  CustomContainer(
                      child: customImage(
                          kIconNoWifi, sw * 0.3, sw * 0.3, BoxFit.contain)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "You are stop the request offline",
                    style: ktextstyle.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            offline = false;
                          });
                        },
                        child: CustomButton(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            text: "ONLINE"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: CustomButton(
                            color: false,
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            text: "Cancel"),
                      ),
                    ],
                  )
                ],
              ],
            ),
          ),
        ),
      );
    } else if (button == 2) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          blurRadius: 6,
                          spreadRadius: 6)
                    ],
                    border: GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: [kcolorblue, kcolorpurple]))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              button = 1;
                            },
                            child: customImage(kIconArrowBack, sw * 0.05,
                                sw * 0.05, BoxFit.contain)),
                        CustomContainer(
                            child: Row(
                          children: [
                            customImage(kIconFoodDelivery, sw * 0.05, sw * 0.05,
                                BoxFit.contain),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Customer Request",
                              style: ktextstyle.copyWith(fontSize: 12),
                            ),
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    containerDetails(context),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              customImage(kmap, sw, sh * 0.5, BoxFit.fill),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          blurRadius: 6,
                          spreadRadius: 6)
                    ],
                    border: GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: [kcolorblue, kcolorpurple]))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomContainer(
                        child: Row(
                      children: [
                        customImage(kIconDollar, 20, 20, BoxFit.contain),
                        Text(
                          "Suggested Cost 40 LE or More!",
                          style: ktextstyle.copyWith(fontSize: 14.sp),
                        )
                      ],
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomContainer(
                        paddingbottom: 2,
                        paddingtop: 2,
                        child: CustomTextFeild(
                          controller: typemsgController,
                          prefixIcon: kIconMessage,
                          labelText: "Type Here",
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          startTime1();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return PopupCard(
                                    content: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Your Offer Has Been Sent Successfully",
                                          textAlign: TextAlign.center,
                                          style: ktextstyle.copyWith(
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Please Wait Till The Customer Check Your Offer",
                                          textAlign: TextAlign.center,
                                          style: ktextstyle.copyWith(
                                              fontSize: 14.sp),
                                        )
                                      ],
                                    ),
                                    isbuttons: true,
                                    buttonText1: "Edit",
                                    buttonText2: "Cancel",
                                    onbutton1: () {
                                      Navigator.pop(context);
                                      _timer?.cancel();
                                    },
                                    onbutton2: () {
                                      Navigator.pop(context);
                                      _timer?.cancel();
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return PopupCard(
                                                content: Column(
                                                  children: [
                                                    Text(
                                                      "Are you sure you want to delete your Request?",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          ktextstyle.copyWith(
                                                              fontSize: 14.sp),
                                                    )
                                                  ],
                                                ),
                                                width: sw * 0.9,
                                                height: sh * 0.3,
                                                isbuttons: true,
                                                buttonText1: "Delete",
                                                buttonText2: "No",
                                                onbutton1: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    button = 1;
                                                  });
                                                },
                                                onbutton2: () {
                                                  startTime1();
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return PopupCard(
                                                            content: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Your Offer Has Been Sent Successfully",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: ktextstyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              14.sp),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Text(
                                                                  "Please Wait Till The Customer Check Your Offer",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: ktextstyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              14.sp),
                                                                )
                                                              ],
                                                            ),
                                                            isbuttons: true,
                                                            buttonText1: "Edit",
                                                            buttonText2:
                                                                "Cancel",
                                                            onbutton1: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            width: sw * 0.9,
                                                            height: sh * 0.3,
                                                            icon:
                                                                kIconHourglass);
                                                      });
                                                },
                                                icon: kIconDelete);
                                          });
                                    },
                                    width: sw * 0.9,
                                    height: sh * 0.3,
                                    icon: kIconHourglass);
                              });
                        },
                        child: CustomButton(width: sw * 0.3, text: "GO")),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else if (button == 3) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    customImage(kIconArrowBack, 20, 20, BoxFit.contain),
                    CustomContainer(
                        child: Row(
                      children: [
                        customImage(
                            kIconInterviewColor, 25, 25, BoxFit.contain),
                        SizedBox(width: 12),
                        Text(
                          "Customer Request",
                          style: ktextstyle.copyWith(fontSize: 13.sp),
                        )
                      ],
                    )),
                    Expanded(
                      child: Text("Muhammad Ali   #47561384354",
                          style: ktextstyle.copyWith(fontSize: 13.sp)),
                    ),
                    customImage(kprofile, 60, 60, BoxFit.contain)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                containerDetails(context, details: true),
                const SizedBox(
                  height: 10,
                ),
                CustomContainer(
                    paddingleft: 7,
                    paddingright: 7,
                    colorborder: false,
                    borderRadius: 0,
                    child: Row(
                      children: [
                        CustomContainer(
                            marginright: 5,
                            marginleft: 5,
                            paddingbottom: 4,
                            paddingleft: 4,
                            paddingright: 4,
                            paddingtop: 4,
                            child: Text("To Pick up ",
                                style: ktextstyle.copyWith(fontSize: 14))),
                        Spacer(),
                        CustomContainer(
                            marginright: 5,
                            marginleft: 5,
                            paddingbottom: 4,
                            paddingleft: 4,
                            paddingright: 4,
                            paddingtop: 4,
                            colorborder: false,
                            child: customImage(
                                kIconDetailSheet, 15, 15, BoxFit.contain)),
                        CustomContainer(
                            marginright: 5,
                            marginleft: 5,
                            paddingbottom: 4,
                            paddingleft: 4,
                            paddingright: 4,
                            paddingtop: 4,
                            colorborder: false,
                            child:
                                customImage(kIconMap, 15, 15, BoxFit.contain)),
                        CustomContainer(
                            marginright: 5,
                            marginleft: 5,
                            paddingbottom: 4,
                            paddingleft: 4,
                            paddingright: 4,
                            paddingtop: 4,
                            colorborder: false,
                            child:
                                customImage(kIconCall, 15, 15, BoxFit.contain)),
                        CustomContainer(
                            marginright: 5,
                            marginleft: 5,
                            paddingbottom: 4,
                            paddingleft: 4,
                            paddingright: 4,
                            paddingtop: 4,
                            colorborder: false,
                            child: customImage(
                                kIconBadface, 15, 15, BoxFit.contain)),
                        CustomContainer(
                            marginright: 5,
                            marginleft: 5,
                            paddingbottom: 4,
                            paddingleft: 4,
                            paddingright: 4,
                            paddingtop: 4,
                            colorborder: false,
                            child: customImage(
                                kIconDelete, 15, 15, BoxFit.contain)),
                      ],
                    )),
                Column(
                  children: [
                    CustomContainer(
                        child: Text("05, NOv 2023",
                            style: ktextstyle.copyWith(fontSize: 12.sp))),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: CustomContainer(
                          child: Text("Hello sir how may I help you?",
                              style: ktextstyle.copyWith(fontSize: 12.sp))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomContainer(
                          child: CustomTextFeild(
                        controller: typemsgController,
                        prefixIcon: kIconSmile,
                        suffixIcon: kIconAttachment,
                      )),
                    ),
                    CustomContainer(
                        child: customImage(kIconMic, 20, 20, BoxFit.contain))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else if (button == 4) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              button = 3;
                            });
                          },
                          child: customImage(
                              kIconArrowBack, 20, 20, BoxFit.contain)),
                      CustomContainer(
                          child: Row(
                        children: [
                          customImage(
                              kIconInterviewColor, 20, 20, BoxFit.contain),
                          Text(
                            "  Customer Request",
                            style: ktextstyle.copyWith(fontSize: 13.sp),
                          )
                        ],
                      )),
                      Expanded(
                        child: Text("Muhammad Ali   #47561384354",
                            style: ktextstyle.copyWith(fontSize: 13.sp)),
                      ),
                      customImage(kprofile, 60, 60, BoxFit.contain)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                containerDetails(context, details: true),
                CustomContainer(
                    marginright: 25,
                    marginleft: 25,
                    child: Column(children: [
                      customRow(kIconShoppingCart, "Purchase Cost", "200 .LE"),
                      const SizedBox(
                        height: 10,
                      ),
                      customRow(kIconMotorbike, "Delivery Cost", "52 .LE"),
                      const SizedBox(
                        height: 10,
                      ),
                      customRow(kIconDetailSheet, "Tax", "1.2 .LE"),
                      const SizedBox(
                        height: 10,
                      ),
                      customRow(kIconSearch, "Comission", "1 .LE"),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: kcolorblue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Total (with Tax)",
                              style: ktextstyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          const Spacer(),
                          Text("253 .LE",
                              style: ktextstyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500))
                        ],
                      )
                    ])),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Row(
                    children: [
                      customImage(kIconFeedback, 30, 30, BoxFit.contain),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Feedback",
                          style: ktextstyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Row(
                        children: [
                          customImage(kIconStar, 30, 30, BoxFit.contain),
                          for (int i = 0; i <= 3; i++)
                            customImage(
                                kIconUnfilledStar, 30, 30, BoxFit.contain)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(width: sw * 0.3, text: "COMPLAINT"),
                    CustomButton(
                        color: false, width: sw * 0.3, text: "THANKS LATER"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomContainer(
                    colorborder: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            customImage(kIconCamera, 20, 20, BoxFit.contain),
                            SizedBox(
                              width: 10,
                            ),
                            customImage(kIconMic, 20, 20, BoxFit.contain),
                          ],
                        ),
                        CustomTextFeild(
                          controller: typemsgController,
                          maxlines: 5,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        button = 1;
                      });
                    },
                    child: CustomButton(width: sw * 0.5, text: "GO")),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget customContainerRequest(title, {bool check = false}) {
    return Expanded(
      child: CustomContainer(
          colorborder: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: ktextstyle.copyWith(fontSize: 10.sp),
                ),
              ),
              if (check == true)
                customImage(kIconDropdown, 10, 10, BoxFit.contain)
            ],
          )),
    );
  }

  Widget customRow(image, title, price) {
    return Row(
      children: [
        customImage(image, 20, 20, BoxFit.contain),
        Text(title,
            style: ktextstyle.copyWith(
                fontSize: 12.sp, fontWeight: FontWeight.w500)),
        const Spacer(),
        Text(price,
            style: ktextstyle.copyWith(
                fontSize: 12.sp, fontWeight: FontWeight.w500))
      ],
    );
  }
}
