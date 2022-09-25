import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/apis.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/header_model.dart';
import '../models/page_response_model.dart';
import '../styles/colors.dart';

class HomePageController extends GetxController with StateMixin {
  final headermodel = <HeaderModel>[];

  PageResponsemodel pageResponse = PageResponsemodel();
  final scrolControler = ScrollController();
  int page = 1;

  @override
  void onInit() {
    headermodel.add(HeaderModel('assets/images/bottom_left_arrow.png', 'Owe me',
        '\$ 1 250', '2 debts', AppColors.colorTilegreen));
    headermodel.add(HeaderModel('assets/images/top_right_arrow.png', 'I owe',
        '\$ 1 130', '2 debts', AppColors.colorTileOrange));
    headermodel.add(HeaderModel('assets/images/bottom_left_arrow.png', 'Owe me',
        '\$ 1 250', '2 dents', AppColors.colorTilegreen));
    headermodel.add(HeaderModel('assets/images/top_right_arrow.png', 'I owe',
        '\$ 1 130', '2 dents', AppColors.colorTileOrange));

    getLoyalty();
    change(state, status: RxStatus.success());
    super.onInit();
  }

  void getLoyalty() async {
    PageResponsemodel data = await ApiService().getDebtDetails(page);
    pageResponse = data;

    update();
  }
}
