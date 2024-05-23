import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/text_style.dart';
import 'custom_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;

  CustomAppBar({required this.title, required this.context});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kcolorblack,
      title: Text(
        title,
        style: ktextstyle.copyWith(fontSize: 14.sp),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: customImage(kIconArrowBack, 15, 15, BoxFit.contain),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
