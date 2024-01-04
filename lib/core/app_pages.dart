import 'package:get/get.dart';
import 'package:manajemen_keuangan/core/app_routes.dart';
import 'package:manajemen_keuangan/pages/all_transaction_page.dart';
import 'package:manajemen_keuangan/pages/analytic_page.dart';
import 'package:manajemen_keuangan/pages/auth/register_page.dart';
import 'package:manajemen_keuangan/pages/home_page.dart';
import 'package:manajemen_keuangan/pages/auth/login_page.dart';

import '../pages/submit_page.dart';

class AppPages {
  static const splash = Routes.splash;
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomePage()),
    GetPage(name: Routes.category, page: () => AnalyticPage()),
    GetPage(name: Routes.allTransaction, page: () => const AllTransaction()),
    GetPage(name: Routes.submit, page: () => SubmitPage()),
    GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.register, page: () => RegisterPage()),
  ];
}
