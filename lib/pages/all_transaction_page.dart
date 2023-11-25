import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTransaction extends GetView {
  const AllTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        onDateChanged: (value) => (value),
        firstDate: DateTime.now().subtract(const Duration(days: 90)),
        lastDate: DateTime.now(),
        backButton: false,
        locale: 'id',
        accent: Colors.green.shade900,
      ),
    );
  }
}
