import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:manajemen_keuangan/pages/analytic_page.dart';
import 'package:manajemen_keuangan/pages/home_page.dart';

class MainPage extends GetView {
  final List<Widget> _children = [const HomePage(), const AnalyticPage()];
  final _selectedIndex = 0.obs;

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _children[_selectedIndex.value]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        height: 60,
        shape: const CircularNotchedRectangle(),
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    _selectedIndex.value = 0;
                    print("home");
                  },
                  icon: _selectedIndex.value == 0
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            "assets/home.svg",
                            colorFilter: const ColorFilter.mode(
                                Colors.purple, BlendMode.srcIn),
                          ))
                      : SizedBox(
                          height: 18,
                          width: 18,
                          child: SvgPicture.asset("assets/home (1).svg")),
                ),
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                  onPressed: () {
                    _selectedIndex.value = 1;
                    print("category");
                  },
                  icon: _selectedIndex.value == 1
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            "assets/chart-pie-alt.svg",
                            colorFilter: const ColorFilter.mode(
                                Colors.purple, BlendMode.srcIn),
                          ))
                      : SizedBox(
                          height: 18,
                          width: 18,
                          child:
                              SvgPicture.asset("assets/chart-pie-alt (1).svg")),
                )
              ],
            )),
      ),
    );
  }
}
