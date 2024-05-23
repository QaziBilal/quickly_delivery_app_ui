import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:quickly_delivery_man/src/models/home_menu_icons.dart';
import 'package:quickly_delivery_man/src/utils/colors.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/utils/images.dart';
import 'package:quickly_delivery_man/src/views/home/set_location.dart';
import 'package:quickly_delivery_man/src/widgets/container_details.dart';
import 'package:quickly_delivery_man/src/widgets/custom_button.dart';
import 'package:quickly_delivery_man/src/widgets/custom_container.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';
import 'package:quickly_delivery_man/src/widgets/text_field.dart';

import '../../utils/text_style.dart';
import '../../widgets/dialog_box.dart';
import 'custom_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int button = 1;
  String selectedValue = 'one';

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 8, vsync: this);
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    if (button == 1) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: sh * 0.1),
            child: Column(
              children: [
                const CustomSlider(),
                const SizedBox(
                  height: 20,
                ),
                customGridview(iconsList, false, sw),
                const SizedBox(
                  height: 20,
                ),
                listviewDesign(sw, sh, "supermarkets", kIconShoppingCart),
                listviewDesign(sw, sh, "Resturants", kIconknife),
                listviewDesign(sw, sh, "Cafes", kIconCoffee),
                CustomContainer(
                    marginright: sw * 0.6,
                    child: Row(
                      children: [
                        customImage(
                            kIconCall, sw * 0.05, sw * 0.05, BoxFit.contain),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Contact Us",
                          style: ktextstyle.copyWith(fontSize: 12),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                customGridview(socialIconsList, true, sw)
              ],
            ),
          ),
        ),
      );
    } else if (button == 2) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            button = 1;
                          });
                        },
                        child: arrowBack()),
                    CustomContainer(
                        child: Row(
                      children: [
                        customImage(
                          kIconMapFind,
                          20,
                          20,
                          BoxFit.contain,
                        ),
                        Text(
                          "Drop Me",
                          style: ktextstyle.copyWith(fontSize: 12),
                        )
                      ],
                    ))
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      button = 3;
                    });
                  },
                  child: CustomContainer(
                      marginleft: 20,
                      marginright: 20,
                      child: Row(
                        children: [
                          customImage(
                            kIconIosPin,
                            20,
                            20,
                            BoxFit.contain,
                          ),
                          SizedBox(width: 10),
                          Text("Choose Starting Point",
                              style: ktextstyle.copyWith(fontSize: 12))
                        ],
                      )),
                ),
                InkWell(onTap: () {}, child: customRow("A", "+", sw)),
                customRow("B", "X", sw),
                customRow("C", "X", sw),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainer(
                        paddingleft: 8,
                        paddingright: 8,
                        marginright: 3,
                        child: Text("Distance:    20Km",
                            style: ktextstyle.copyWith(fontSize: 12))),
                    CustomContainer(
                        paddingleft: 8,
                        paddingright: 8,
                        marginright: 3,
                        child: Text("Duration:    25 Min",
                            style: ktextstyle.copyWith(fontSize: 12))),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                          child: Text("Vehicle Type",
                              style: ktextstyle.copyWith(fontSize: 12))),
                      Row(
                        children: [
                          CustomContainer(
                              paddingbottom: 6,
                              paddingtop: 6,
                              paddingleft: 10,
                              paddingright: 10,
                              child: Text(
                                "  ",
                                style: ktextstyle.copyWith(fontSize: 12.sp),
                              )),
                          Text("Any", style: ktextstyle.copyWith(fontSize: 12))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                gridview(sw),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2024));
                        },
                        child:
                            customRow1(kIconCalendar, "Appointment", sw, 0.0)),
                    InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2024));
                        },
                        child: customRow1(
                            kIconMdCalendar, "20 Nov 2020", sw, 0.0)),
                    InkWell(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                        },
                        child: customRow1(kIconClock, "03:15 PM", sw, 0.0)),
                  ],
                ),
                Row(
                  children: [
                    CustomContainer(
                        child: Row(
                      children: [
                        customImage(
                          kIconUser,
                          sw * 0.03,
                          sw * 0.03,
                          BoxFit.contain,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Cash",
                            style: ktextstyle.copyWith(fontSize: 12.sp)),
                        customImage(
                          kIconDropdown,
                          sw * 0.02,
                          sw * 0.02,
                          BoxFit.contain,
                        ),
                      ],
                    )),
                    CustomContainer(
                        paddingbottom: 6,
                        paddingtop: 6,
                        paddingleft: 10,
                        paddingright: 10,
                        child: Text(
                          "  ",
                          style: ktextstyle.copyWith(fontSize: 12.sp),
                        )),
                    customImage(
                      kIconUser,
                      sw * 0.03,
                      sw * 0.03,
                      BoxFit.contain,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Female To Female",
                      style: ktextstyle.copyWith(fontSize: 12.sp),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(right: sw * 0.5),
                    child: customRow1(kIconCoupon, "Coupons", sw, 10)),
                Container(
                    margin: EdgeInsets.only(right: sw * 0.5),
                    child: customRow1(kIconDetailSheet, "Details", sw, 10)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 15, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 5)
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                      "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
                      style: ktextstyle.copyWith(fontSize: 13)),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        button = 4;
                      });
                    },
                    child: CustomButton(width: 200, text: "GO"))
              ],
            ),
          ),
        ),
      );
    } else if (button == 3) {
      return Scaffold(
          backgroundColor: kcolorblack,
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomContainer(
                  marginleft: 0,
                  marginright: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  button = 2;
                                });
                              },
                              child: arrowBack()),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                          ),
                          Expanded(
                            child: CustomContainer(
                              child: Row(
                                children: [
                                  customImage(
                                    kIconIosPin,
                                    18,
                                    18,
                                    BoxFit.contain,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Choose Starting point",
                                    style: ktextstyle.copyWith(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      customRow("A", "+", sw),
                      customRow("B", "X", sw),
                      customRow("C", "X", sw),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SetLocationScreen(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                CustomContainer(
                                  marginright: 5,
                                  paddingbottom: 5,
                                  paddingtop: 5,
                                  paddingleft: 5,
                                  paddingright: 5,
                                  child: customImage(
                                    kIconHome,
                                    20,
                                    20,
                                    BoxFit.contain,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Home",
                                      style:
                                          ktextstyle.copyWith(fontSize: 12.sp),
                                    ),
                                    Text(
                                      "9.3298",
                                      style:
                                          ktextstyle.copyWith(fontSize: 12.sp),
                                    )
                                  ],
                                ),
                                CustomContainer(
                                  marginright: 5,
                                  paddingbottom: 5,
                                  paddingtop: 5,
                                  paddingleft: 5,
                                  paddingright: 5,
                                  child: customImage(
                                    kIconCoffee,
                                    20,
                                    20,
                                    BoxFit.contain,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Work",
                                      style:
                                          ktextstyle.copyWith(fontSize: 12.sp),
                                    ),
                                    Text("Set Location",
                                        style: ktextstyle.copyWith(
                                            fontSize: 12.sp))
                                  ],
                                ),
                                CustomContainer(
                                  marginright: 5,
                                  paddingbottom: 5,
                                  paddingtop: 5,
                                  paddingleft: 5,
                                  paddingright: 5,
                                  child: customImage(
                                    kIcondots,
                                    20,
                                    20,
                                    BoxFit.contain,
                                  ),
                                ),
                                Text("More",
                                    style:
                                        ktextstyle.copyWith(fontSize: 12.sp)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                customImage(kmap, sw, sh * 0.6, BoxFit.fill)
              ],
            ),
          ));
    } else if (button == 4) {
      return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          button = 2;
                        });
                      },
                      child: arrowBack()),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CustomContainer(
                        paddingleft: 8,
                        paddingright: 8,
                        marginright: 3,
                        child: Text("Cost",
                            style: ktextstyle.copyWith(fontSize: 14.sp)),
                      ),
                      CustomContainer(
                        paddingleft: 8,
                        paddingright: 8,
                        marginright: 3,
                        child: Text("Nearby",
                            style: ktextstyle.copyWith(fontSize: 14.sp)),
                      ),
                      CustomContainer(
                        paddingleft: 8,
                        paddingright: 8,
                        marginright: 3,
                        child: customImage(
                          kIconSortAlphaDown,
                          20,
                          20,
                          BoxFit.contain,
                        ),
                      ),
                      const Spacer(),
                      CustomContainer(
                        paddingleft: 8,
                        paddingright: 8,
                        marginright: 3,
                        child: customImage(
                          kIconEdit,
                          20,
                          20,
                          BoxFit.contain,
                        ),
                      ),
                      CustomContainer(
                        paddingleft: 8,
                        paddingright: 8,
                        marginright: 12,
                        child: customImage(
                          kIconDelete,
                          20,
                          20,
                          BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  containerDetails(context, button: true),
                ],
              ),
            ),
          ));
    } else if (button == 5) {
      return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: customImage(
                        kbanner,
                        sw,
                        sh * 0.2,
                        BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        top: 10,
                        left: 10,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                button = 1;
                              });
                            },
                            child: arrowBack())),
                    Positioned(
                      top: sh * 0.19,
                      left: 5,
                      right: 15,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 15),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: customImage(
                              kprofile,
                              100,
                              70,
                              BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Velentino's Pasta",
                                style: ktextstyle.copyWith(fontSize: 14.sp),
                              ),
                              Text(
                                "Super Market",
                                style: ktextstyle.copyWith(fontSize: 14.sp),
                              ),
                              Row(
                                children: [
                                  customImage(
                                    kIconStar,
                                    10,
                                    10,
                                    BoxFit.contain,
                                  ),
                                  Text(
                                    "4.5",
                                    style: ktextstyle.copyWith(fontSize: 12.sp),
                                  ),
                                  Text(
                                    "4144 Reviews",
                                    style: ktextstyle.copyWith(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          customImage(
                            kIconShare,
                            20,
                            20,
                            BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sh * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is availableIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
                    textAlign: TextAlign.justify,
                    style: ktextstyle.copyWith(fontSize: 14.sp),
                  ),
                ),
                CustomContainer(
                  marginright: 15,
                  marginleft: 15,
                  child: Row(
                    children: [
                      customImage(
                        kIconLocationArrow,
                        20,
                        20,
                        BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The CourtYard Maadi Palestine Rd, Cairo jslkajf jsaklfjui kdjsaf",
                              style: ktextstyle.copyWith(fontSize: 14.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "0.15 KM",
                              style: ktextstyle.copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      customImage(
                        kIconEdit,
                        20,
                        20,
                        BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PopupCard(
                          width: sw * 0.9,
                          height: sh * 0.8,
                          scrollable1: true,
                          icon: kIconClock,
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Working Hours",
                                style: ktextstyle.copyWith(fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              for (int i = 0; i <= 7; i++)
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: kcolorblack,
                                      boxShadow: [
                                        BoxShadow(
                                            color: kcolorwhite.withOpacity(0.2),
                                            blurRadius: 5,
                                            spreadRadius: 3)
                                      ]),
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 10),
                                  child: Row(
                                    children: [
                                      customImage(
                                        kIconCalendar,
                                        30,
                                        30,
                                        BoxFit.contain,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Saturday",
                                              style: ktextstyle.copyWith(
                                                  fontSize: 14.sp),
                                            ),
                                            Row(
                                              children: [
                                                customImage(
                                                  kIconClock,
                                                  15,
                                                  15,
                                                  BoxFit.contain,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "10:00 AM- 03:00 AM",
                                                  style: ktextstyle.copyWith(
                                                      fontSize: 12.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              CustomButton(width: 200, text: "GO"),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: CustomContainer(
                    marginright: 15,
                    marginleft: 15,
                    child: Row(
                      children: [
                        customImage(
                          kIconClock,
                          25,
                          25,
                          BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open Now",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: ktextstyle.copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              "10:00 AM- 1:00 PM",
                              style: ktextstyle.copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          "Show",
                          style: ktextstyle.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomContainer(
                  marginright: 15,
                  marginleft: 15,
                  child: Text(
                    "Menu",
                    style: ktextstyle.copyWith(fontSize: 14.sp),
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerColor: kcolorblack,
                  indicatorColor: kcolorblue,
                  tabs: [
                    Text(
                      "Special Offers",
                      style: ktextstyle.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      "Burgers",
                      style: ktextstyle.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      "Sandwiches",
                      style: ktextstyle.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      "Pizza",
                      style: ktextstyle.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      "Juices",
                      style: ktextstyle.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      "Coffee",
                      style: ktextstyle.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      "Medicine",
                      style: ktextstyle.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      "Fashion",
                      style: ktextstyle.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: kcolorblack,
                  height: sh,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      tabbarMenuWidget(sw, sh),
                      tabbarMenuWidget(sw, sh),
                      tabbarMenuWidget(sw, sh),
                      tabbarMenuWidget(sw, sh),
                      tabbarMenuWidget(sw, sh),
                      tabbarMenuWidget(sw, sh),
                      tabbarMenuWidget(sw, sh),
                      tabbarMenuWidget(sw, sh),
                    ],
                  ),
                ),
              ],
            ),
          ));
    } else if (button == 6) {
      return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              button = 1;
                            });
                          },
                          child: arrowBack()),
                      CustomContainer(
                        child: Row(
                          children: [
                            customImage(
                              kIconknife,
                              20,
                              20,
                              BoxFit.contain,
                            ),
                            SizedBox(width: 10),
                            Text("Restaurants",
                                style: ktextstyle.copyWith(fontSize: 12.sp)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  customGridview(iconsList, false, sw, length: 5),
                  CustomContainer(
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: customImage(
                            kimage,
                            sw * 0.2,
                            sw * 0.2,
                            BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Valentinos Pasta",
                                style: ktextstyle.copyWith(fontSize: 14.sp)),
                            Text("SuperMarket",
                                style: ktextstyle.copyWith(fontSize: 12.sp)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    customImage(
                                      kIconStar,
                                      20,
                                      20,
                                      BoxFit.contain,
                                    ),
                                    Text("  4.5",
                                        style: ktextstyle.copyWith(
                                            fontSize: 12.sp)),
                                  ],
                                ),
                                SizedBox(
                                  width: sw * 0.2,
                                ),
                                Row(
                                  children: [
                                    customImage(
                                      kIconLocationArrow,
                                      20,
                                      20,
                                      BoxFit.contain,
                                    ),
                                    Text("  0.15 KM",
                                        style: ktextstyle.copyWith(
                                            fontSize: 12.sp)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    } else {
      return Container();
    }
  }

  Widget tabbarMenuWidget(sw, sh) {
    return Column(
      children: [
        for (int i = 0; i <= 3; i++) customContainer11(sw, sh),
        const SizedBox(
          height: 10,
        ),
        CustomContainer(
            child:
                Text("The Order", style: ktextstyle.copyWith(fontSize: 12.sp))),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: sw,
          height: sh * 0.1,
          margin: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(color: Colors.black, boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 5)
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(width: sw * 0.3, text: "GO"),
            CustomButton(width: sw * 0.3, text: "NEW ORDER")
          ],
        )
      ],
    );
  }

  Future modalBottomSheet(sw, sh) {
    return showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 5)
              ]),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Speical Burger',
                      style: ktextstyle.copyWith(fontSize: 14.sp)),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: kcolorblue,
                      ))
                ],
              ),
              SizedBox(height: 15),
              CustomContainer(
                  marginleft: 0,
                  marginright: 0,
                  paddingleft: 0,
                  paddingtop: 0,
                  paddingbottom: 0,
                  paddingright: 0,
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: customImage(kbanner, sw, sh * 0.1, BoxFit.fill))),
              Text(
                "Burger + Fries + Cola",
                style: ktextstyle.copyWith(fontSize: 13.sp),
              ),
              const Divider(),
              Text("Choose Your Soft Drink",
                  style: ktextstyle.copyWith(fontSize: 13.sp)),
              for (int i = 0; i <= 2; i++)
                Row(
                  children: [
                    CustomContainer(
                        child: Text("  ",
                            style: ktextstyle.copyWith(fontSize: 12.sp))),
                    Text("Coca Cola",
                        style: ktextstyle.copyWith(fontSize: 13.sp)),
                    const Spacer(),
                    Text("0.00 EGP",
                        style: ktextstyle.copyWith(fontSize: 13.sp))
                  ],
                ),
              const SizedBox(
                height: 20,
              ),
              Center(child: CustomButton(width: sw * 0.4, text: "-    1    +")),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "20.0 EGP",
                  style: ktextstyle.copyWith(fontSize: 12.sp),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      Center(child: CustomButton(width: sw * 0.3, text: "ADD")))
            ]),
          ),
        );
      },
    );
  }

  Widget customContainer11(sw, sh) {
    return InkWell(
      onTap: () {
        modalBottomSheet(sw, sh);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 2)
            ]),
        child: Row(children: [
          Expanded(
            flex: 3,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Special Burger",
                  style: ktextstyle.copyWith(
                      fontSize: 15.sp, fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 5,
              ),
              Text(
                  "Lorem ipsum dolor sit amet,consetetur sadispsinhg elitr,esd diam nourmy eimod tempor invidunste ut labore ete dsafh",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: ktextstyle.copyWith(fontSize: 14.sp)),
              const SizedBox(
                height: 5,
              ),
              Text("20.0 EGP", style: ktextstyle.copyWith(fontSize: 14.sp))
            ]),
          ),
          CustomContainer(
              paddingbottom: 0,
              paddingleft: 0,
              paddingright: 0,
              paddingtop: 0,
              child: customImage(kbanner, sw * 0.2, sw * 0.2, BoxFit.cover))
        ]),
      ),
    );
  }

  Widget gridview(sw) {
    return GridView.builder(
        padding: const EdgeInsets.only(left: 40, right: 40),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        itemCount: carTypeList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(color: Colors.black, boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.4),
                  blurRadius: 4,
                  spreadRadius: 4)
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customImage(carTypeList[index].image, sw * 0.15, sw * 0.15,
                    BoxFit.contain),
                Text(carTypeList[index].title,
                    style: ktextstyle.copyWith(fontSize: 13.sp)),
                Text(carTypeList[index].petrol,
                    style: ktextstyle.copyWith(fontSize: 13.sp)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customImage(
                        kIconUser, sw * 0.02, sw * 0.02, BoxFit.contain),
                    Text(carTypeList[index].seats,
                        style: ktextstyle.copyWith(fontSize: 13.sp))
                  ],
                )
              ],
            ),
          );
        });
  }

  Widget customRow1(icon, title, sw, marginright) {
    return CustomContainer(
        paddingleft: 8,
        paddingright: 8,
        marginright: 5,
        child: Row(
          children: [
            customImage(icon, sw * 0.03, sw * 0.03, BoxFit.contain),
            const SizedBox(
              width: 8,
            ),
            Text(title, style: ktextstyle.copyWith(fontSize: 10.sp)),
          ],
        ));
  }

  Widget customRow(first, last, sw, {String title = ""}) {
    return Row(
      children: [
        CustomContainer(
            child: Text(
          first,
          style: ktextstyle.copyWith(fontSize: 12.sp),
        )),
        Expanded(
          child: CustomContainer(
              paddingbottom: 0,
              paddingtop: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customImage(
                      kIconIosPin, sw * 0.05, sw * 0.05, BoxFit.contain),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      dropdownColor: kcolorblack,
                      padding: EdgeInsets.all(0),
                      value: "one",
                      onChanged: (newValue) {
                        setState(() {});
                      },
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      icon: customImage(
                          kIconDropdown, sw * 0.02, sw * 0.02, BoxFit.contain),
                      items: [
                        DropdownMenuItem(
                            value: "one",
                            child: Text(
                              "Chosse Drop off Point 1              ",
                              style: ktextstyle.copyWith(fontSize: 10.sp),
                            )),
                        DropdownMenuItem(
                            value: "two",
                            child: Text(
                              "Chosse Drop off Point 2                  ",
                              style: ktextstyle.copyWith(fontSize: 10.sp),
                            )),
                        DropdownMenuItem(
                            value: "three",
                            child: Text(
                              "Chosse Drop off Point 3                ",
                              style: ktextstyle.copyWith(fontSize: 10.sp),
                            ))
                      ],
                    ),
                  ),
                ],
              )),
        ),
        CustomContainer(
            child: Text(
          last,
          style: ktextstyle.copyWith(fontSize: 12.sp),
        )),
      ],
    );
  }

  Widget customGridview(list, bool check, sw, {int length = 0}) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.93,
            mainAxisSpacing: 7,
            crossAxisCount: check == true ? 6 : 5),
        itemCount: length == 0 ? list.length : length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    button = 2;
                  });
                },
                child: CustomContainer(
                    borderRadius: 15,
                    paddingleft: 8,
                    paddingright: 8,
                    paddingbottom: 8,
                    paddingtop: 8,
                    child: customImage(
                      list[index].icons,
                      sw * 0.05,
                      sw * 0.05,
                      BoxFit.contain,
                    )),
              ),
              Expanded(
                child: Text(
                  list[index].title,
                  textAlign: TextAlign.center,
                  style: ktextstyle.copyWith(fontSize: 12.sp),
                ),
              )
            ],
          );
        });
  }

  Widget listviewDesign(double sw, double sh, String title, String image) {
    return Container(
      padding: const EdgeInsets.only(left: 5, top: 8, bottom: 10, right: 5),
      margin: const EdgeInsets.only(left: 15, bottom: 20, right: 15),
      decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.4),
                blurRadius: 4,
                spreadRadius: 4)
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomContainer(
                  child: Row(
                children: [
                  customImage(image, sw * 0.05, sw * 0.05, BoxFit.contain),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: ktextstyle.copyWith(fontSize: 12.sp),
                  ),
                ],
              )),
              InkWell(
                  onTap: () {
                    setState(() {
                      button = 6;
                    });
                  },
                  child: CustomContainer(
                      marginright: 15,
                      child: Text(
                        "See All",
                        style: ktextstyle.copyWith(fontSize: 12.sp),
                      )))
            ],
          ),
          SizedBox(
            height: sh * 0.3,
            child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        button = 5;
                      });
                    },
                    child: CustomContainer(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customImage(kbanner, sw * 0.7, sh * 0.13, BoxFit.fill),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Valentinos Pasta",
                          style: ktextstyle.copyWith(fontSize: 12.sp),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          title,
                          style: ktextstyle.copyWith(fontSize: 12.sp),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                customImage(kIconStar, sw * 0.04, sh * 0.04,
                                    BoxFit.contain),
                                Text(
                                  "4.5",
                                  style: ktextstyle.copyWith(fontSize: 12.sp),
                                )
                              ],
                            ),
                            SizedBox(
                              width: sw * 0.48,
                            ),
                            Row(
                              children: [
                                customImage(kIconLocationArrow, sw * 0.04,
                                    sh * 0.04, BoxFit.contain),
                                Text(
                                  "0.15 KM",
                                  style: ktextstyle.copyWith(fontSize: 12.sp),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget arrowBack() {
    return customImage(
      kIconArrowBack,
      25,
      25,
      BoxFit.contain,
    );
  }
}
