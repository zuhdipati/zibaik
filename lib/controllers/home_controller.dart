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
  var userData = UserModel().obs;
  var idTransaction = '';
  RxList transactions = [].obs;
  RxBool isLoading = false.obs;
  RxBool isTransactionLoading = false.obs;

  final String _baseUrl = "https://long-pink-coati.cyclic.app";
  final String _user = "/api/account/me";
  final String _transaction =
      "/api/transaction/?limit=5&page=0&timeUnit=month&timeAmount=1&sort=desc";

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
          idTransaction = item['_id'];
          print("ID TRANSAKSI $idTransaction");
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

  Future<void> deleteTransaction() async {
    final String deleteTrx = "/api/transaction/delete/$idTransaction";

    String token = (await _auth.getCurrentToken()).token;

    var headers = {'Authorization': token};
    var url = Uri.parse(_baseUrl + deleteTrx);
    try {
      Get.dialog(AlertDialog(
        title: Text("Hapus transaksi?"),
        actions: [
          TextButton(
            child: const Text('Tidak'),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: const Text('Ya'),
            onPressed: () async {
              Get.back();
              Get.back();
              isLoading.value = true;
              var response = await http.delete(url, headers: headers);
              print(response);
              if (response.statusCode == 200) {
                getTransaction();
                getUser();
                update();
                Get.snackbar("Berhasil", "Data dihapus");
              }
            },
          ),
        ],
      ));
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
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
