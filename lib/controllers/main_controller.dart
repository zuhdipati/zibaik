import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_keuangan/pages/main/analytic_page.dart';
import 'package:manajemen_keuangan/pages/main/home_page.dart';

class MainController extends GetxController {
  final List<Widget> pages = [const HomePage(), AnalyticPage()].obs;
  final RxInt selectedIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
  }

  void changePageIndex(int index) {
    pageController.jumpToPage(index);
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
