import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manajemen_keuangan/core/app_pages.dart';
import 'package:manajemen_keuangan/core/app_theme.dart';
import 'package:manajemen_keuangan/firebase_options.dart';
import 'package:manajemen_keuangan/pages/auth/login_page.dart';
import 'package:manajemen_keuangan/pages/main/home_page.dart';
import 'package:manajemen_keuangan/pages/main_page.dart';
// import 'package:manajemen_keuangan/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Zibaik());
}

class Zibaik extends StatelessWidget {
  const Zibaik({super.key});

  @override
  Widget build(BuildContext context) {
    Widget authLogin;

    if (FirebaseAuth.instance.currentUser != null) {
      authLogin = HomePage();
    } else {
      authLogin = LoginPage();
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: "Zibaik App",
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: authLogin,
      getPages: AppPages.pages,
    );
  }
}
