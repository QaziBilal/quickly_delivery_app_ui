import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/utils/images.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';
import 'package:quickly_delivery_man/src/views/home/home.dart';
import 'package:quickly_delivery_man/src/views/notification/notification.dart';
import 'package:quickly_delivery_man/src/views/profile/profile.dart';
import 'package:quickly_delivery_man/src/views/request/request.dart';
import 'package:quickly_delivery_man/src/views/support/support.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';

import '../utils/colors.dart';

class MainScreen extends StatefulWidget {
  int currentindex;
  MainScreen({required this.currentindex, super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: pages.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  final List<Widget> pages = [
    RequestScreen(),
    Notificationscreen(),
    HomeScreen(),
    SupportScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customImage(klogo, sw * 0.5, sh * 0.1, BoxFit.contain),
                  Row(
                    children: [
                      customImage(kIconFoodDelivery, sw * 0.07, sw * 0.07,
                          BoxFit.contain),
                      SizedBox(
                        width: 10,
                      ),
                      customImage(
                          kIconSetting, sw * 0.07, sw * 0.07, BoxFit.contain),
                      SizedBox(
                        width: 10,
                      ),
                      customImage(
                          kIconSearch, sw * 0.07, sw * 0.07, BoxFit.contain),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            tabbar(),
            Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children:
                        List.generate(pages.length, (index) => pages[index]))),
          ],
        ),
      ),
    );
  }

  Widget tabbar() {
    return TabBar(
        labelPadding: EdgeInsets.zero,
        indicator: const BoxDecoration(color: Colors.transparent),
        indicatorSize: TabBarIndicatorSize.tab,
        controller: _tabController,
        tabs: [
          designIcon(0, kIconInterviewColor, kIconInterview, "Requests"),
          designIcon(1, kIconNotificationsActive, kIconNotificationsUnactive,
              "Notifications"),
          designIcon(2, kIconStoreColor, kIconStore, "Home"),
          designIcon(3, kIconSupportColor, kIconSupport, "Support"),
          designIcon(4, kIconUserColor, kIconUser, "Profile"),
        ]);
  }

  Widget designIcon(index, imageselected, imageunselected, title) {
    double sw = MediaQuery.sizeOf(context).width;

    return Tab(
      height: sw * 0.17,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: Column(
              children: [
                _currentIndex == index
                    ? customImage(
                        imageselected, sw * 0.05, sw * 0.05, BoxFit.contain)
                    : customImage(
                        imageunselected, sw * 0.05, sw * 0.05, BoxFit.contain),
                Text(
                  title,
                  style: ktextstyle.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),
          if (_currentIndex == index)
            Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 3),
                height: 20,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    border: GradientBoxBorder(
                        gradient:
                            LinearGradient(colors: [kcolorpurple, kcolorblue])),
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14))),
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 2,
                  color: Colors.white,
                ))
        ],
      ),
    );
  }
}
