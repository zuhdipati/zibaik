import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_keuangan/api/auth_service.dart';
import 'package:manajemen_keuangan/controllers/home_controller.dart';
import 'package:manajemen_keuangan/core/app_routes.dart';
import 'package:manajemen_keuangan/models/submit_model.dart';
import 'package:http/http.dart' as http;

class SubmitController extends GetxController {
  final String _baseUrl = "https://long-pink-coati.cyclic.app";
  final String _createTransaction = "/api/transaction/create";

  final AuthService _auth = AuthService();
  RxBool isExpense = true.obs;
  RxInt isSelected = RxInt(-1);
  RxBool isLoading = false.obs;
  TextEditingController amount = TextEditingController();
  RxString categoryType = "".obs;
  String? transactionType;
  String? iconUrl;
  RxInt quantity = 1.obs;

  final List<CategoryModel> listIncome = [
    CategoryModel(name: "Rokok", svgIcon: "assets/submit/rokok.svg"),
    CategoryModel(name: "Beras", svgIcon: "assets/submit/beras.svg"),
    CategoryModel(name: "Minuman", svgIcon: "assets/submit/minuman.svg"),
    CategoryModel(name: "Makanan", svgIcon: "assets/submit/makanan.svg"),
    CategoryModel(name: "Shampoo", svgIcon: "assets/submit/sampo.svg"),
    CategoryModel(name: "Sabun", svgIcon: "assets/submit/sabun.svg"),
    CategoryModel(name: "Kopi Sachet", svgIcon: "assets/submit/kopi.svg"),
    CategoryModel(name: "Mie", svgIcon: "assets/submit/mie.svg"),
    CategoryModel(name: "Lainnya", svgIcon: "assets/submit/lainnya.svg"),
  ];

  final List<CategoryModel> listExpense = [
    CategoryModel(name: "Listrik", svgIcon: "assets/submit/listrik.svg"),
    CategoryModel(name: "Air", svgIcon: "assets/submit/air.svg"),
    CategoryModel(name: "Sewa", svgIcon: "assets/submit/sewa tempat.svg"),
    CategoryModel(name: "Minuman", svgIcon: "assets/submit/minuman.svg"),
    CategoryModel(name: "Makanan", svgIcon: "assets/submit/makanan.svg"),
    CategoryModel(name: "Lainnya", svgIcon: "assets/submit/lainnya.svg"),
  ];

  Future<void> submitData() async {
    isLoading.value = true;
    Get.dialog(
        barrierDismissible: false,
        const Center(child: CircularProgressIndicator()));
    String token = (await _auth.getCurrentToken()).token;
    amount.text = (int.parse(amount.text) * quantity.value).toString();

    var url = Uri.parse(_baseUrl + _createTransaction);
    var headers = {'Authorization': token};
    var body = {
      "amount": amount.text,
      "categoryType": categoryType.value,
      "transactionType": transactionType!.toLowerCase(),
      "iconUrl": iconUrl,
      "quantity": quantity.value.toString(),
      "comment": "haha"
    };

    try {
      var response = await http.post(url, headers: headers, body: body);
      var decode = jsonDecode(response.body);
      print("DECODE $decode");

      if (decode['status'] == 'SUCCESS') {
        print("Success Post Data");
        update();
        Get.snackbar("Berhasil", "Data berhasil ditambah");
        Get.find<HomeController>().getTransaction();
        Get.find<HomeController>().getUser();
        Get.offNamedUntil(
          Routes.home,
          (route) => false,
        );
        isLoading.value = false;
      } else {
        print("Failed Post Data");
        Get.back();
        Get.snackbar("Gagal", "Data gagal ditambah",
            colorText: Colors.white, backgroundColor: Colors.red);
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }
}
