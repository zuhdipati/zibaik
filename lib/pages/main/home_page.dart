import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manajemen_keuangan/controllers/auth_controller.dart';
import 'package:manajemen_keuangan/controllers/home_controller.dart';
import 'package:manajemen_keuangan/core/app_routes.dart';
import 'package:manajemen_keuangan/widgets/shimmer.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final homeController = Get.put(HomeController());
    final oCcy = NumberFormat.decimalPattern('id');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Selamat Datang, ",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: const Text(
                    "ZIBAIK",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  trailing: TextButton(
                      onPressed: () {
                        authController.signOut();
                        Get.delete<HomeController>();
                        Get.delete<AuthController>();
                      },
                      child: const Text("Keluar")),
                ),
                Bounceable(
                  onTap: () {},
                  child: Container(
                    height: 200,
                    width: Get.width,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/bg_card.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total Keuangan",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "IDR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 20),
                            ),
                            const SizedBox(width: 5),
                            Obx(() => homeController.isLoading.value == true
                                ? const TotalBalanceShimmer()
                                : Text(
                                    oCcy.format(homeController
                                        .userData.value.totalBalance),
                                    style: TextStyle(
                                        color: homeController.userData.value
                                                    .totalBalance! <
                                                0
                                            ? Colors.red
                                            : Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 40),
                                  ))
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: Get.width / 3.5,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_downward,
                                          size: 15,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          "Masuk",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Obx(() =>
                                        homeController.isLoading.value == true
                                            ? const InExShimmer()
                                            : Text(
                                                "Rp ${oCcy.format(homeController.userData.value.income)}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              )),
                                  ],
                                ),
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
                              SizedBox(
                                width: Get.width / 3.5,
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_upward,
                                          size: 15,
                                          color: Colors.red,
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          "Keluar",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Obx(() =>
                                          homeController.isLoading.value == true
                                              ? const InExShimmer()
                                              : Text(
                                                  "Rp ${oCcy.format(homeController.userData.value.expense)}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Transaksi Terbaru",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Get.toNamed(Routes.allTransaction);
                      },
                      child: const Text(
                        "Lihat Semua",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: GetBuilder<HomeController>(
                    init: homeController,
                    builder: (homeController) {
                      if (homeController.isTransactionLoading.value == true) {
                        return const TrxShimmer();
                      } else if (homeController.transactions.isEmpty) {
                        return SizedBox(
                          height: Get.height / 2.2,
                          child: const Center(
                            child: Text('Belum ada transaksi'),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: homeController.transactions.length,
                          itemBuilder: (context, index) {
                            var transaction =
                                homeController.transactions[index];
                            return GestureDetector(
                              onLongPress: () {
                                _bottomSheet(transaction, oCcy, homeController);
                              },
                              child: Bounceable(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 1,
                                            color: Colors.grey,
                                            offset: Offset(0, 1),
                                            spreadRadius: 1)
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade900,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              transaction.iconUrl,
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          transaction.categoryType,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        subtitle: Text(
                                          transaction.transactionType,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                        trailing: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 1),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                transaction.transactionType ==
                                                        "expense"
                                                    ? "Rp -${oCcy.format(transaction.amount)}"
                                                    : "Rp ${oCcy.format(transaction.amount)}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                homeController.formatDate(
                                                    transaction
                                                        .createdTimestamp),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Get.toNamed(Routes.submit);
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<dynamic> _bottomSheet(
      transaction, NumberFormat oCcy, HomeController homeController) {
    return Get.bottomSheet(Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 7,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade700),
            ),
          ),
          ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    transaction.iconUrl,
                    color: Colors.amber,
                  ),
                ),
              ),
              title: Text(
                transaction.categoryType,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                transaction.transactionType,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      transaction.transactionType == "expense"
                          ? "Rp -${oCcy.format(transaction.amount)}"
                          : "Rp ${oCcy.format(transaction.amount)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      homeController.formatDate(transaction.createdTimestamp),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              )),
          Text(
              "Kuantitas: ${transaction.quantity.toString()} x Rp${oCcy.format(transaction.amount / transaction.quantity)}"),
          const SizedBox(height: 10),
          Container(
            width: Get.width,
            height: 1,
            color: Colors.grey.shade700,
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     alignment: Alignment.centerLeft,
          //     height: 50,
          //     width: Get.width,
          //     child: const Text(
          //       "Hapus",
          //       style: TextStyle(
          //           color: Colors.red,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     alignment: Alignment.centerLeft,
          //     height: 50,
          //     width: Get.width,
          //     child: Text(
          //       "Edit",
          //       style: TextStyle(
          //           color: Colors.grey.shade900, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // )
        ],
      ),
    ));
  }
}
