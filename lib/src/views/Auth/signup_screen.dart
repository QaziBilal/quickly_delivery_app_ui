import 'package:flutter/material.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/views/Auth/login_screen.dart';
import 'package:quickly_delivery_man/src/widgets/bottom_social_login.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/text_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/text_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: kcolorblack,
      body: Stack(
        children: [
          Positioned.fill(child: signup(sw, sh, context)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: socialMediaBottomLogin(sw, sh),
          )
        ],
      ),
    );
  }

  Widget signup(sw, sh, context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: sh * 0.1,
            ),
            Image.asset(
              klogo,
              width: sw * 0.7,
              height: sh * 0.1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Name",
              style: ktextstyle.copyWith(fontSize: 14),
            ),
            CustomContainer(
              marginright: 20,
              marginleft: 0,
              paddingleft: 0,
              child: CustomTextFeild(
                controller: nameController,
              ),
            ),
            Text(
              "Phone Number",
              style: ktextstyle.copyWith(fontSize: 14),
            ),
            CustomContainer(
              marginright: 20,
              marginleft: 0,
              paddingleft: 5,
              child: CustomTextFeild(
                controller: phoneController,
              ),
            ),
            Text(
              "Email",
              style: ktextstyle.copyWith(fontSize: 14),
            ),
            CustomContainer(
              marginright: 20,
              marginleft: 0,
              paddingleft: 5,
              child: CustomTextFeild(
                controller: emailController,
              ),
            ),
            Text(
              "Password",
              style: ktextstyle.copyWith(fontSize: 14),
            ),
            CustomContainer(
              marginright: 20,
              marginleft: 0,
              paddingleft: 5,
              child: CustomTextFeild(
                controller: passwordController,
                obscureText: true,
                suffixIcon: kIconShowHide,
                width: 2,
                height: 2,
              ),
            ),
            Text(
              "Confirm Password",
              style: ktextstyle.copyWith(fontSize: 14),
            ),
            CustomContainer(
              marginright: 20,
              marginleft: 0,
              paddingleft: 5,
              child: CustomTextFeild(
                controller: passwordController,
                obscureText: true,
                suffixIcon: kIconShowHide,
                width: 2,
                height: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                  paddingbottom: 15,
                  paddingright: 15,
                  width: sw * 0.5,
                  text: "SIGNUP"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "By continuing, you agree to accept our Privacy Policy & Terms of Service.",
              style: ktextstyle.copyWith(letterSpacing: 0.6, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Already  Have An Account ?",
                style: ktextstyle.copyWith(letterSpacing: 0.6, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: CustomButton(
                    paddingbottom: 15,
                    paddingright: 15,
                    width: sw * 0.5,
                    text: "LOGIN"),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "OR",
                style: ktextstyle.copyWith(letterSpacing: 0.6, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            if (sw >= 450)
              SizedBox(
                height: sh * 0.25,
              )
            else if (sw >= 350)
              SizedBox(
                height: sh * 0.2,
              )
          ],
        ),
      ),
    );
  }
}
