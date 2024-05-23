import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickly_delivery_man/src/widgets/custom_button.dart';
import 'package:quickly_delivery_man/src/widgets/custom_container.dart';
import 'package:quickly_delivery_man/src/widgets/text_field.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/text_style.dart';
import '../../widgets/custom_image.dart';

class AddCreditCardScreen extends StatelessWidget {
  AddCreditCardScreen({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expiray = TextEditingController();
  TextEditingController cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorblack,
      appBar: AppBar(
        backgroundColor: kcolorblack,
        title: Text(
          "Add Credit Card",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomContainer(
                  paddingleft: 5,
                  paddingbottom: 5,
                  paddingright: 5,
                  paddingtop: 5,
                  child: customImage(kIconVisa, 150, 90, BoxFit.fill)),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Name on Card",
                style: ktextstyle.copyWith(fontSize: 13.sp),
              ),
            ),
            CustomContainer(
                paddingleft: 5,
                paddingbottom: 5,
                paddingright: 5,
                paddingtop: 5,
                child: CustomTextFeild(
                  controller: name,
                  suffixIcon: kIconUser,
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Card Number",
                style: ktextstyle.copyWith(fontSize: 13.sp),
              ),
            ),
            CustomContainer(
                paddingleft: 5,
                paddingbottom: 5,
                paddingright: 5,
                paddingtop: 5,
                child: CustomTextFeild(
                  controller: cardNumber,
                  suffixIcon: kIconCreditCard,
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Expiry Date",
                          style: ktextstyle.copyWith(fontSize: 13.sp),
                        ),
                      ),
                      CustomContainer(
                          paddingleft: 5,
                          paddingbottom: 5,
                          paddingright: 5,
                          paddingtop: 5,
                          child: CustomTextFeild(
                            controller: expiray,
                            suffixIcon: kIconMdCalendar,
                            ontap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2023),
                                  lastDate: DateTime(2024));
                            },
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "CVV",
                          style: ktextstyle.copyWith(fontSize: 13.sp),
                        ),
                      ),
                      CustomContainer(
                          paddingleft: 5,
                          paddingbottom: 5,
                          paddingright: 5,
                          paddingtop: 5,
                          child: CustomTextFeild(
                            controller: cvv,
                            suffixIcon: kIconLock,
                          )),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.center,
                child: CustomButton(width: 200, text: "ADD CARD"))
          ],
        ),
      ),
    );
  }
}
