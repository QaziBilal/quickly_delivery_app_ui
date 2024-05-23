import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/utils/colors.dart';

import '../../utils/icons.dart';
import '../../utils/text_style.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/profile_option.dart';
import 'add_credit_card.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: kcolorblack,
      appBar: AppBar(
        backgroundColor: kcolorblack,
        title: Text(
          "Payment Methods",
          style: ktextstyle.copyWith(fontSize: 14.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: customImage(kIconArrowBack, 15, 15, BoxFit.contain)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            options(kIconPaymentCash, "Cash", false, false, sw),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCreditCardScreen()));
                },
                child: options(
                    kIconCreditCard, "Add Credit Card", false, false, sw))
          ],
        ),
      ),
    );
  }
}
