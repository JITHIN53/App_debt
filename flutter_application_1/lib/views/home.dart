import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/homepage_controller.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../styles/textstyles.dart';
import '../widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Home'),
      body: GetBuilder<HomePageController>(
        builder: (controller) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: 140.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: homePageController.headermodel.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(width: 11),
                        itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                          height: 160,
                          width: 147,
                          decoration: BoxDecoration(
                              color:
                                  homePageController.headermodel[index].color,
                              border: Border.all(
                                color:
                                    homePageController.headermodel[index].color,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // crossAxisAlignment: CrossAxisAlignment
                                //     .end,
                                children: [
                                  Text(
                                      homePageController
                                          .headermodel[index].title,
                                      style: cartTitleStyle),
                                  Image.asset(
                                    homePageController.headermodel[index].image,
                                    height: 30,
                                    width: 30,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 9),
                              Text(
                                  homePageController
                                      .headermodel[index].subtitle,
                                  style: cartSubtitleStyle),
                              const SizedBox(height: 9),
                              Text(homePageController.headermodel[index].count,
                                  style: cartTitleStyle),
                              const SizedBox(height: 2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(22, 75, 22, 10),
                          decoration: const BoxDecoration(
                            color: AppColors.sheetColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.sheetColor,
                                  spreadRadius: 0,
                                  blurRadius: 3),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('My debts', style: myDbtStyle),
                                  Text(
                                    'See All',
                                    style: seeStyle,
                                  )
                                ],
                              ),
                              SizedBox(height: 15.h),
                              homePageController.pageResponse != null &&
                                      homePageController.pageResponse != null &&
                                      homePageController.pageResponse.data !=
                                          null
                                  ? Expanded(
                                      child: CustomScrollView(
                                        controller:
                                            homePageController.scrolControler,
                                        slivers: [
                                          SliverList(
                                            delegate:
                                                SliverChildBuilderDelegate(
                                              (BuildContext context,
                                                  int index) {
                                                if (index <
                                                    homePageController
                                                        .pageResponse
                                                        .data!
                                                        .length) {
                                                  final items =
                                                      homePageController
                                                          .pageResponse
                                                          .data![index];
                                                  return Column(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .tileColor,
                                                          border: Border.all(
                                                            color: AppColors
                                                                .tileColor,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                        child: ListTile(
                                                          horizontalTitleGap: 2,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 0.0,
                                                                  horizontal:
                                                                      12.0),
                                                          leading:
                                                              // Text("ehhehhe"),

                                                              Transform
                                                                  .translate(
                                                            offset:
                                                                const Offset(
                                                                    -0, 2),
                                                            child:
                                                                Image.network(
                                                              items.img!,
                                                              height: 30,
                                                            ),
                                                          ),
                                                          title: Text(
                                                            items.name!,
                                                            style:
                                                                titleTextStyle,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 6.h),
                                                    ],
                                                  );
                                                } else {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: AppColors
                                                          .colorTileOrange,
                                                    ),
                                                  );
                                                }
                                              },
                                              childCount: homePageController
                                                      .pageResponse
                                                      .data!
                                                      .length +
                                                  1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : const CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 125.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 60.h,
                          width: 60.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.bgolor),
                          child: CircleAvatar(
                            backgroundColor: AppColors.roundTileColor,
                            child: Image.asset('assets/images/plus.png',
                                height: 13.h),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text('NEW', style: iconTextStyle),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 60.h,
                          width: 60.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.bgolor),
                          child: CircleAvatar(
                            backgroundColor: AppColors.roundTileColor,
                            child: Image.asset(
                                'assets/images/topright-arrow.png',
                                height: 13.h),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text('PAY OFF', style: iconTextStyle),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 60.h,
                          width: 60.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.bgolor),
                          child: CircleAvatar(
                            backgroundColor: AppColors.roundTileColor,
                            child: Image.asset(
                                'assets/images/bottomleft_arrow.png',
                                height: 13.h),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text('LEND', style: iconTextStyle),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 60.h,
                          width: 60.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.bgolor),
                          child: CircleAvatar(
                            backgroundColor: AppColors.roundTileColor,
                            child: Image.asset('assets/images/grid.png',
                                height: 13.h),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text('MORE', style: iconTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
