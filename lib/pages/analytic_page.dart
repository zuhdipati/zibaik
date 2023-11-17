import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticPage extends GetView {
  const AnalyticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        onDateChanged: (value) => (value),
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now(),
        backButton: false,
        locale: 'id',
        accent: Colors.purple,
      ),
    );
  }
}
