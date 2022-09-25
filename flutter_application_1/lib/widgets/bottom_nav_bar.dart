// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../styles/textstyles.dart';
import '../views/home.dart';

class BottomTabPage extends StatefulWidget {
  const BottomTabPage({Key? key}) : super(key: key);

  @override
  State<BottomTabPage> createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      initialIndex: tabIndex,
      length: 4,
      child: Scaffold(
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomePage(),
            HomePage(),
            HomePage(),
            HomePage(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: 4.h,
          ),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColors.yellowColor,
            indicator: BoxDecoration(
              color: AppColors.tileColor,
              border: Border(
                top: BorderSide(color: AppColors.yellowColor, width: Get.width),
              ),
            ),
            unselectedLabelColor: AppColors.roundTileColor,
            labelColor: AppColors.colorTileHalfBlue,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/home.png', height: 12.h),
                      Text(
                        'Home',
                        style: tabTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/history.png', height: 12.h),
                      Text(
                        'History',
                        style: tabTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/articles.png', height: 12.h),
                      Text(
                        'Articles',
                        style: tabTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/plus_2.png', height: 12.h),
                      Text(
                        'Add',
                        style: tabTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
