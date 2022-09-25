import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/textstyles.dart';

AppBar appBar(BuildContext context, String text) {
  return AppBar(
    elevation: 2,
    backgroundColor: AppColors.gradientEndColor,
    centerTitle: true,
    title: Text(text, style: appBartitleTextStyle),
    actions: [
      Image.asset(
        'assets/images/notifications.png',
        height: 20.h,
        width: 20.h,
      ),
      SizedBox(
        width: 15.h,
      ),
    ],
  );
}
