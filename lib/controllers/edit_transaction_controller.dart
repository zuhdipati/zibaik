import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_keuangan/api/auth_service.dart';
import 'package:manajemen_keuangan/controllers/home_controller.dart';
import 'package:manajemen_keuangan/core/app_routes.dart';
import 'package:manajemen_keuangan/models/submit_model.dart';
import 'package:http/http.dart' as http;

class EditTransactionController extends GetxController {
  final String _baseUrl = "https://long-pink-coati.cyclic.app";
  final String _createTransaction = "/api/transaction/edit";

  final AuthService _auth = AuthService();
  RxBool isExpense = true.obs;
  RxInt isSelected = RxInt(-1);
  RxBool isLoading = false.obs;
  String? idTrx;
  TextEditingController amount = TextEditingController();
  TextEditingController comment = TextEditingController();
  RxString categoryType = "".obs;
  String? transactionType;
  String? iconUrl;
  RxInt quantity = 0.obs;

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
    CategoryModel(
        name: "Sewa Tempat", svgIcon: "assets/submit/sewa tempat.svg"),
    CategoryModel(name: "Minuman", svgIcon: "assets/submit/minuman.svg"),
    CategoryModel(name: "Makanan", svgIcon: "assets/submit/makanan.svg"),
    CategoryModel(name: "Lainnya", svgIcon: "assets/submit/lainnya.svg"),
  ];

  initialize(id, amountInit, commentInit, categoryTypeInit, transactionTypeInit,
      iconUrlInit, quantityInit, isExpenseInit) {
    idTrx = id;
    amount.text = amountInit.toString();
    comment.text = commentInit.toString();
    categoryType.value = categoryTypeInit;
    transactionType = transactionTypeInit;
    iconUrl = iconUrlInit;
    quantity.value = quantityInit;
    isExpense.value = isExpenseInit;

    isSelected.value = isExpense.value
        ? listIncome
            .indexWhere((category) => category.name == categoryType.value)
        : listExpense
            .indexWhere((category) => category.name == categoryType.value);
    print("IS SELECT ${isSelected.value}");
  }

  @override
  void onInit() {
    initialize(idTrx, amount, comment, categoryType.value, transactionType,
        iconUrl, quantity.value, isExpense.value);
    super.onInit();
  }

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
      "transactionId": idTrx,
      "amount": amount.text,
      "categoryType": categoryType.value,
      "transactionType": transactionType!.toLowerCase(),
      "iconUrl": iconUrl,
      "quantity": quantity.value.toString(),
      "comment": comment.text.isEmpty ? " " : comment.text
    };

    try {
      var response = await http.patch(url, headers: headers, body: body);
      print("RESPONSE ${jsonDecode(response.body)}");
      var decode = jsonDecode(response.body);
      print("DECODE $decode");

      if (decode['status'] == 'SUCCESS') {
        print("Success Ubah Data");
        update();
        Get.snackbar("Berhasil", "Data berhasil diubah");
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
