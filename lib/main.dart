import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_keuangan/core/app_pages.dart';
import 'package:manajemen_keuangan/core/app_theme.dart';
import 'package:manajemen_keuangan/pages/login_page.dart';
// import 'package:manajemen_keuangan/pages/main_page.dart';

void main() {
  runApp(const Zibaik());
}

class Zibaik extends StatelessWidget {
  const Zibaik({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Zibaik App",
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      getPages: AppPages.pages,
    );
  }
}
