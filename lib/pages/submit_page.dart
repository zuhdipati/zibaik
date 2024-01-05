import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manajemen_keuangan/controllers/submit_controller.dart';

class SubmitPage extends StatelessWidget {
  SubmitPage({super.key});

  final controller = Get.put(SubmitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Row(
          children: [
            Obx(() => Text(controller.isExpense.value ? "Income" : "Expenses",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, color: Colors.black))),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () =>
                  controller.isExpense.value = !controller.isExpense.value,
              child: SvgPicture.asset(
                'assets/refresh.svg',
                width: 18,
                height: 18,
              ),
            )
          ],
        ),
        actions: [
          _saveButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height / 1.13,
          child: Stack(
            children: [
              GridView.builder(
                shrinkWrap: true,
                itemCount: controller.listCategory.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (controller.isSelected.value == index) {
                        controller.isSelected.value = -1;
                      } else {
                        controller.isSelected.value = index;
                      }
                    },
                    child: Obx(() => Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: controller.isSelected.value == index
                                  ? Colors.lightGreenAccent.shade100
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  controller.listCategory[index].svgIcon,
                                  height: 25,
                                  width: 25),
                              const SizedBox(height: 10),
                              Text(controller.listCategory[index].name),
                            ],
                          )),
                        )),
                  );
                },
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.green.shade900,
                  height: Get.height * 0.08,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: SizedBox(
                            width: 75,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/coins.svg',
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Rp:",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          prefixStyle: const TextStyle(fontSize: 10),
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 20)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _inputValue() {
    return Positioned(
      bottom: 0,
      child: Container(
        color: Colors.green.shade900,
        height: Get.height * 0.08,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            textAlign: TextAlign.end,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: SizedBox(
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/coins.svg',
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Rp:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                prefixStyle: const TextStyle(fontSize: 10),
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 20)),
          ),
        ),
      ),
    );
  }

  _icons() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: controller.listCategory.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (controller.isSelected.value == index) {
              controller.isSelected.value = -1;
            } else {
              controller.isSelected.value = index;
            }
          },
          child: Obx(() => Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: controller.isSelected.value == index
                        ? Colors.lightGreenAccent.shade100
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(controller.listCategory[index].svgIcon,
                        height: 25, width: 25),
                    const SizedBox(height: 10),
                    Text(controller.listCategory[index].name),
                  ],
                )),
              )),
        );
      },
    );
  }

  _saveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade900,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: const Text("Save")),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
