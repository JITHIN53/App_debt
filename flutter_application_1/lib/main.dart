import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/bottom_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const DebtApp());
        });
  }
}

class DebtApp extends StatefulWidget {
  const DebtApp({Key? key}) : super(key: key);

  @override
  _DebtAppState createState() => _DebtAppState();
}

class _DebtAppState extends State<DebtApp> {
  @override
  Widget build(BuildContext context) {
    return const BottomTabPage();
  }
}
