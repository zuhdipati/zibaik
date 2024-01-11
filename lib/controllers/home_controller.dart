import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:manajemen_keuangan/api/auth_service.dart';
import 'package:manajemen_keuangan/models/transaction_model.dart';
import 'package:manajemen_keuangan/models/user_model.dart';

final AuthService _auth = AuthService();

class HomeController extends GetxController {
  final String _baseUrl = "https://long-pink-coati.cyclic.app";
  final String _user = "/api/account/me";
  final String _transaction =
      "/api/transaction/?limit=10&page=0&timeUnit=month&timeAmount=1&sort=asc";

  var userData = UserModel().obs;
  RxList transactions = [].obs;
  RxBool isLoading = false.obs;
  RxBool isTransactionLoading = false.obs;

  Future<void> getUser() async {
    try {
      isLoading.value = true;
      String token = (await _auth.getCurrentToken()).token;

      var headers = {'Authorization': token};
      var url = Uri.parse(_baseUrl + _user);

      var response = await http.get(url, headers: headers);
      var decode = jsonDecode(response.body);
      if (decode['status'] == 'SUCCESS') {
        var data = decode['result'];
        userData.value = UserModel.fromJson(data);
        update();
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }

  Future<RxList<dynamic>> getTransaction() async {
    try {
      isTransactionLoading.value = true;
      String token = (await _auth.getCurrentToken()).token;

      var headers = {'Authorization': token};
      var url = Uri.parse(_baseUrl + _transaction);

      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print(data);

        transactions.value = data.map((item) {
          return Transaction.fromJson(item);
        }).toList();

        isTransactionLoading.value = false;
        update();

        return transactions;
      } else {
        debugPrint(
            "Failed to fetch transactions. Status code: ${response.statusCode}");
        isTransactionLoading.value = false;
        return [].obs;
      }
    } catch (e) {
      debugPrint(e.toString());
      return [].obs;
    }
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }

  @override
  void onInit() {
    getUser();
    getTransaction();
    super.onInit();
  }
}
