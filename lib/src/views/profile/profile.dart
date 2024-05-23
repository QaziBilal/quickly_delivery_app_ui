import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/utils/images.dart';
import 'package:quickly_delivery_man/src/views/profile/payment_methods.dart';
import 'package:quickly_delivery_man/src/views/profile/settings.dart';
import 'package:quickly_delivery_man/src/widgets/custom_container.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';

import '../../utils/text_style.dart';
import '../../widgets/profile_option.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
                child: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: kIsWeb
                        ? NetworkImage("assets/$kprofile") as ImageProvider
                        : AssetImage(kprofile)),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile Name",
                      style: ktextstyle.copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        customImage(
                            kIconStar, sw * 0.03, sw * 0.03, BoxFit.contain),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "4.5",
                          style: ktextstyle.copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        customImage(kIconVerifiedUser, sw * 0.03, sw * 0.03,
                            BoxFit.contain),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Verified",
                          style: ktextstyle.copyWith(fontSize: 12.sp),
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    customImage(kIconNotificationsOutline, sw * 0.05, sw * 0.05,
                        BoxFit.contain),
                    SizedBox(
                      width: 10,
                    ),
                    customImage(
                        kIconLogout, sw * 0.05, sw * 0.05, BoxFit.contain),
                  ],
                )
              ],
            )),
            options(kIconNameCard, "View My Quickly ID", false, false, sw),
            options(
                kIconDollar,
                "Account Balance",
                true,
                true,
                suffixText: "999.00 EGP",
                sw),
            options(
                kIconIncreasedRevenue, "Total Delivery Revenue", true, true, sw,
                suffixText: "999.00 EGP"),
            options(kIconShoppingBag, "Number of Orders", true, true, sw,
                suffixText: "47 Orders"),
            options(kIconUnfilledStar, "Service Reviews", true, false, sw,
                suffixText: "0"),
            options(kIconFeedback, "User Feedback", true, false, sw,
                suffixText: "33"),
            options(kIconCoupon, "Coupons", true, false, sw),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
              child: options(kIconSetting, "Settings", true, false, sw),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentMethodScreen()));
                },
                child: options(
                    kIconCreditCard, "Payment Methods", true, false, sw))
          ],
        ),
      ),
    );
  }
}
