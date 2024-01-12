import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:manajemen_keuangan/api/auth_service.dart';
import 'package:manajemen_keuangan/models/transaction_model.dart';

String current = DateTime.now().toString();
DateTime dateTime = DateTime.parse(current);
String formatted = DateFormat('dd MMMM yyyy').format(dateTime);
String formattedCalendarDate = DateFormat('dd').format(dateTime);
final AuthService _auth = AuthService();

class AllTransactionController extends GetxController {
  RxString currentDate = current.obs;
  RxString formattedDate = formatted.obs;
  RxList transactions = [].obs;
  RxBool isTransactionLoading = false.obs;
  RxInt calendarDate = int.parse(formattedCalendarDate).obs;

  Future<RxList<dynamic>> getTransaction() async {
    update();
    isTransactionLoading.value = true;
    const String baseUrl = "https://long-pink-coati.cyclic.app";
    final String transaction =
        "/api/transaction/?startTime=2024-01-$calendarDate&endTime=2024-01-$calendarDate&sort=desc";

    try {
      String token = (await _auth.getCurrentToken()).token;

      var headers = {'Authorization': token};
      var url = Uri.parse(baseUrl + transaction);
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        log(data.toString());

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
    final DateFormat formatter = DateFormat('dd MMM yyyy', 'id');
    return formatter.format(dateTime);
  }

  @override
  void onInit() {
    getTransaction();
    super.onInit();
  }
}
