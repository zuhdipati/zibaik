import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manajemen_keuangan/controllers/submit_controller.dart';

class SubmitPage extends StatelessWidget {
  SubmitPage({super.key});

  final controller = Get.put(SubmitController());
  final oCcy = NumberFormat.decimalPattern('id');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Obx(() => Text(
                                controller.isExpense.value
                                    ? "Income"
                                    : "Expenses",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black))),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => controller.isExpense.value =
                                  !controller.isExpense.value,
                              child: SvgPicture.asset(
                                'assets/refresh.svg',
                                width: 18,
                                height: 18,
                              ),
                            ),
                          ],
                        ),
                        Obx(() => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade900,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.amount.text.isEmpty ||
                                            controller.categoryType.isEmpty
                                        ? Get.snackbar("Perhatian",
                                            "Masukkan semua data terlebih dahulu",
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white)
                                        : _saveDataDialog();
                                  },
                                  child: controller.isLoading.value == true
                                      ? const Center(
                                          child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child:
                                                  CircularProgressIndicator()))
                                      : const Text("Simpan")),
                            )),
                      ],
                    ),
                    Obx(() => GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.isExpense.value
                              ? controller.listIncome.length
                              : controller.listExpense.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemBuilder: (context, index) {
                            controller.transactionType =
                                controller.isExpense.value
                                    ? "Income"
                                    : "Expense";

                            return InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                if (controller.isSelected.value == index) {
                                  // controller.isSelected.value = -1;
                                  controller.categoryType.value = "";
                                } else {
                                  controller.isSelected.value = index;
                                }
                                controller.categoryType.value =
                                    controller.isExpense.value
                                        ? controller.listIncome[index].name
                                        : controller.listExpense[index].name;
                                controller.iconUrl = controller.isExpense.value
                                    ? controller.listIncome[index].svgIcon
                                    : controller.listExpense[index].svgIcon;
                              },
                              child: Obx(() => Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color:
                                            controller.isSelected.value == index
                                                ? Colors.grey.shade300
                                                : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            controller.isExpense.value
                                                ? controller
                                                    .listIncome[index].svgIcon
                                                : controller
                                                    .listExpense[index].svgIcon,
                                            height: 25,
                                            width: 25),
                                        const SizedBox(height: 10),
                                        Text(
                                          controller.isExpense.value
                                              ? controller
                                                  .listIncome[index].name
                                              : controller
                                                  .listExpense[index].name,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    )),
                                  )),
                            );
                          },
                        )),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Obx(() => controller.categoryType.value == ""
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.categoryType.value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          if (controller.quantity.value > 1) {
                                            controller.quantity.value--;
                                          }
                                        },
                                        child:
                                            const Icon(CupertinoIcons.minus)),
                                    const SizedBox(width: 5),
                                    Text(
                                      controller.quantity.value.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                        onTap: () {
                                          controller.quantity.value++;
                                        },
                                        child: const Icon(Icons.add)),
                                  ],
                                )
                              ],
                            ),
                          )),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.grey.shade900,
                      height: Get.height * 0.08,
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: controller.amount,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _saveDataDialog() {
    return Get.dialog(AlertDialog(
      title: Text("Simpan ${controller.transactionType}?"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama: ${controller.categoryType}"),
          Text("Harga: Rp ${oCcy.format(int.parse(controller.amount.text))}"),
          Text("Quantity: x${controller.quantity.value}"),
          const SizedBox(height: 30),
          Text(
              "Total: ${oCcy.format(int.parse(controller.amount.text) * controller.quantity.value)}")
        ],
      ),
      actions: [
        TextButton(
          child: const Text(
            'Tidak',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: const Text('Simpan'),
          onPressed: () async {
            await controller.submitData();
          },
        ),
      ],
    ));
  }
}
