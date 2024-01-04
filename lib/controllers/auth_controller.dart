import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:manajemen_keuangan/core/app_routes.dart';

class AuthController extends GetxController {
  final String _baseUrl = "https://long-pink-coati.cyclic.app";
  final String _login = "/api/auth/sign-in";
  // final String _register = "/api/auth/sign-up";

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final RxBool obsecureText = RxBool(true);
  final RxBool isLoading = RxBool(false);
  RegExp noSpecialCharacter = RegExp(r'^[a-zA-Z0-9]+$');

  Future<void> login() async {
    // Map<String, String> headers = {'Content-Type': 'application/json'};
    var body = {'email': email.text, 'password': password.text};
    Uri url = Uri.parse(_baseUrl + _login);

    isLoading.value = true;
    var request = await http.post(url, body: body);
    final data = json.decode(request.body);
    print(data);
    try {
      if (data['status'] == 'SUCCESS') {
        String token = data['result'];
        debugPrint(token);
        try {
          final credential =
              await FirebaseAuth.instance.signInWithCustomToken(token);
          if (credential.user != null) {
            Get.offAndToNamed(Routes.home);
            isLoading.value = false;
          }
        } on FirebaseAuthException catch (e) {
          debugPrint(e.toString());
        }
      } else if (data['error'] == 'user_not_found') {
        isLoading.value = false;
        Get.snackbar('Error', 'User not found',
            backgroundColor: Colors.red, colorText: Colors.white);
      } else if (data['error'] == 'unauthorized') {
        isLoading.value = false;
        Get.snackbar('Error', 'Wrong email or password',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
