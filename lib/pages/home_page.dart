import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: 43,
                    width: 43,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: const Text(
                    "Welcome, ",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: const Text(
                    "Zuhdi Abdillah",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
                Container(
                  height: 200,
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/leaves.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Column(
                    children: [
                      Text("Total Balance"),
                      Container(),
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
