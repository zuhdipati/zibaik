import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:manajemen_keuangan/controllers/auth_controller.dart';
import 'package:manajemen_keuangan/core/app_routes.dart';

class HomePage extends GetView {
  HomePage({super.key});

  final authController = Get.put(AuthController());
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/teenager.png')),
                        // color: Colors.green.shade900,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: const Text(
                    "Welcome, ",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    args,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  trailing: TextButton(
                      onPressed: () => authController.signOut(),
                      child: Text("Logout")),
                ),
                Bounceable(
                  onTap: () {},
                  child: Container(
                    height: 200,
                    width: Get.width,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/leaves.png'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(child: _cardBalance()),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recent Transaction",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.allTransaction);
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                    children: List.generate(
                  6,
                  (index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      title: const Text(
                        "Coffee",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      subtitle: const Text(
                        "Income",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      trailing: const Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "+ 200.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              "Today",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        ),
                      )),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cardBalance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Total Balance",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "IDR",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 20),
            ),
            SizedBox(width: 5),
            Text(
              "1.000.000",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 40),
            )
          ],
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(10)),
          child: _incomeExpense(),
        )
      ],
    );
  }

  _incomeExpense() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          children: [
            SizedBox(
              width: 3,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_downward,
                  size: 15,
                  color: Colors.green,
                ),
                SizedBox(width: 3),
                Text(
                  "Income",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "2.000.000",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          height: 40,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_upward,
                  size: 15,
                  color: Colors.red,
                ),
                SizedBox(width: 3),
                Text(
                  "Expenses",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "1.000.000",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
