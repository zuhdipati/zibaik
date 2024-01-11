import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/analytic_controller.dart';

class AnalyticPage extends GetView {
  AnalyticPage({Key? key}) : super(key: key);
  final tab = Get.put(AnalyticController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              TabBarView(
                controller: tab.controller,
                children: [
                  // _buildChartsTab(),
                  Center(child: Text('Income')),
                  _buildDataTab()
                ],
              ),
              TabBar(
                controller: tab.controller,
                splashFactory: NoSplash.splashFactory,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.focused)
                      ? null
                      : Colors.transparent;
                }),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.green.shade900),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: "Income"),
                  Tab(text: "Expenses"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildChartsTab() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Column(
              children: [
                SizedBox(
                  height: 200,
                  child: _barChart(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.green.shade900,
                          ),
                        ),
                        const Text("Income"),
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        ),
                        Text("Expenses"),
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        Text("Not yet"),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 200,
              child: PieChart(PieChartData(
                  centerSpaceRadius: 5,
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 2,
                  sections: [
                    PieChartSectionData(
                        value: 35, color: Colors.purple, radius: 100),
                    PieChartSectionData(
                        value: 40, color: Colors.amber, radius: 100),
                    PieChartSectionData(
                        value: 55, color: Colors.green, radius: 100),
                    PieChartSectionData(
                        value: 70, color: Colors.orange, radius: 100),
                  ])),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTab() {
    // You can customize this widget for the second tab
    return const Center(
      child: Text('Expenses'),
    );
  }

  Widget _barChart() {
    return BarChart(BarChartData(
        borderData: FlBorderData(
          border: const Border(
            top: BorderSide.none,
            right: BorderSide.none,
            left: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
          ),
        ),
        barGroups: [
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
                fromY: 0, toY: 8, width: 10, color: Colors.green.shade900),
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
                fromY: 0, toY: 10, width: 10, color: Colors.green.shade900),
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
                fromY: 0, toY: 5, width: 10, color: Colors.green.shade900),
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
                fromY: 0, toY: 9, width: 10, color: Colors.green.shade900),
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
                fromY: 0, toY: 5, width: 10, color: Colors.green.shade900),
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
                fromY: 0, toY: 10, width: 10, color: Colors.green.shade900),
          ]),
          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(fromY: 0, toY: 6, width: 10, color: Colors.grey),
          ]),
        ]));
  }
}
