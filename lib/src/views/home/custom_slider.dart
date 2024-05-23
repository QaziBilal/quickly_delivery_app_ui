import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:quickly_delivery_man/src/utils/colors.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';

import '../../utils/images.dart';
import '../../widgets/custom_button.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final CarouselController controller = CarouselController();
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;

    List<Widget> list = [
      customDesign(sw, sh),
      customDesign(sw, sh),
      customDesign(sw, sh),
    ];

    return Stack(children: [
      CarouselSlider(
        carouselController: controller,
        items: list,
        options: CarouselOptions(
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            scrollPhysics: BouncingScrollPhysics(),
            aspectRatio: 2.5,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentindex = index;
              });
            }),
      ),
      Positioned(
        left: sw * 0.47,
        bottom: 6,
        child: Row(
            children: List<Widget>.generate(
                list.length,
                (index) => currentindex == index
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: kcolorpurple,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.grey.withOpacity(0.7),
                        ),
                      ))),
      )
    ]);
  }

  Widget customDesign(double sw, double sh) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: sw,
          height: 200,
          child: kIsWeb
              ? Image.network(kbanner,
                  fit: BoxFit.fill, opacity: const AlwaysStoppedAnimation(.5))
              : Image.asset(kbanner,
                  fit: BoxFit.fill, opacity: const AlwaysStoppedAnimation(.5)),
        ),
        Positioned(
          top: 10,
          left: sw * 0.15,
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          border: GradientBoxBorder(
                              gradient: LinearGradient(
                                  colors: [kcolorpurple, kcolorblue],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          borderRadius: BorderRadius.circular(10)),
                      child: customImage(
                          kbanner, sw * 0.3, sw * 0.2, BoxFit.fill)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    width: sw * 0.3,
                    text: "100.0 % off",
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Valentino's Pasta",
                    style: ktextstyle.copyWith(fontSize: 12.sp),
                  ),
                  Text(
                    "New on this app",
                    style: ktextstyle.copyWith(fontSize: 12.sp),
                  ),
                  Text(
                    "Pasta from the heart of Egypt",
                    style: ktextstyle.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "On Delivery up to 20.0 EGP",
                    style: ktextstyle.copyWith(fontSize: 12.sp),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
