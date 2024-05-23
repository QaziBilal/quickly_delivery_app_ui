import 'package:flutter/material.dart';
import 'package:quickly_delivery_man/src/utils/icons.dart';
import 'package:quickly_delivery_man/src/utils/images.dart';
import 'package:quickly_delivery_man/src/utils/text_style.dart';
import 'package:quickly_delivery_man/src/views/Auth/signup_screen.dart';
import 'package:quickly_delivery_man/src/views/delivery_man/personal_info.dart';
import 'package:quickly_delivery_man/src/views/main_page.dart';
import 'package:quickly_delivery_man/src/widgets/bottom_social_login.dart';
import 'package:quickly_delivery_man/src/widgets/custom_button.dart';
import 'package:quickly_delivery_man/src/widgets/custom_container.dart';
import 'package:quickly_delivery_man/src/widgets/custom_image.dart';
import 'package:quickly_delivery_man/src/widgets/text_field.dart';
import '../../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: kcolorblack,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: loginPage(sw, sh, context)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: socialMediaBottomLogin(sw, sh),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginPage(sw, sh, context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: sh * 0.1),
          customImage(klogo, sw * 0.7, sh * 0.1, BoxFit.contain),
          SizedBox(height: 20),
          LanguageSelector(),
          SizedBox(height: 20),
          InputField(
            labelText: "Phone Number",
            controller: loginController,
            prefixIcon: kIconMobile,
          ),
          SizedBox(height: 20),
          InputField(
            labelText: "Password",
            controller: passwordController,
            prefixIcon: kIconLock,
            suffixIcon: kIconEye,
            width: 5,
            height: 5,
          ),
          ForgotPasswordText(),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(currentindex: 1),
                ),
              );
            },
            child: CustomButton(
              paddingbottom: 15,
              paddingright: 15,
              width: sw * 0.5,
              text: "LOGIN",
            ),
          ),
          PolicyText(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignupScreen(),
                ),
              );
            },
            child: CustomButton(
              paddingbottom: 15,
              paddingright: 15,
              width: sw * 0.5,
              text: "SIGNUP",
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryManScreen(),
                ),
              );
            },
            child: CustomButton(
              paddingbottom: 15,
              paddingright: 15,
              width: sw * 0.5,
              text: "JOIN AS DELIVERY",
            ),
          ),
          SizedBox(height: 10),
          OrText(),
          if (sw >= 450 || sh >= 300) SizedBox(height: sh * 0.3),
        ],
      ),
    );
  }
}

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainer(
          paddingbottom: 10,
          paddingtop: 10,
          paddingleft: 15,
          paddingright: 15,
          marginleft: 25,
          marginright: 25,
          child: LanguageButton(kIconEnglish, "English"),
        ),
        CustomContainer(
          paddingbottom: 10,
          paddingtop: 10,
          paddingleft: 15,
          paddingright: 15,
          marginleft: 25,
          marginright: 25,
          child: LanguageButton(kIconArabic, "عربي"),
        ),
      ],
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String icon;
  final String text;

  LanguageButton(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 18,
          height: 18,
        ),
        SizedBox(width: 15),
        Text(
          text,
          style: ktextstyle.copyWith(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String prefixIcon;
  final String suffixIcon;
  final double width;
  final double height;
  bool obscureText = false;

  InputField({
    required this.labelText,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon = "",
    this.width = 0,
    this.height = 0,
    bool obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              labelText,
              style: ktextstyle.copyWith(fontSize: 14),
            ),
          ),
        ),
        CustomContainer(
          marginright: 20,
          marginleft: 20,
          paddingleft: 15,
          child: CustomTextFeild(
            controller: controller,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            width: width,
            height: height,
            obscureText: obscureText,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          "Forgot Password?",
          style: ktextstyle.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}

class PolicyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        "By continuing, you agree to accept our Privacy Policy & Terms of Service.",
        style: ktextstyle.copyWith(letterSpacing: 0.6, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class OrText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "OR",
      style: ktextstyle.copyWith(letterSpacing: 0.6, fontSize: 15),
      textAlign: TextAlign.center,
    );
  }
}
