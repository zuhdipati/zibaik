import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manajemen_keuangan/controllers/all_transaction_controller.dart';
import 'package:manajemen_keuangan/widgets/shimmer.dart';

class AllTransaction extends GetView {
  const AllTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AllTransactionController());
    final oCcy = NumberFormat.decimalPattern('id');
    return Scaffold(
      appBar: CalendarAppBar(
        padding: 10,
        onDateChanged: (value) async {
          controller.calendarDate.value =
              int.parse(DateFormat('dd').format(value));
          controller.getTransaction();

          controller.currentDate.value = value.toString();
          controller.formattedDate.value = DateFormat('dd MMMM yyyy', 'id')
              .format(DateTime.parse(controller.currentDate.value));
        },
        firstDate: DateTime.now().subtract(const Duration(days: 90)),
        lastDate: DateTime.now(),
        locale: 'id',
        accent: Colors.grey.shade900,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Row(
                    children: [
                      Text(
                        controller.formattedDate.value,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              GetBuilder<AllTransactionController>(
                init: controller,
                builder: (controller) {
                  if (controller.isTransactionLoading.value == true) {
                    return const TrxShimmer();
                  } else if (controller.transactions.isEmpty) {
                    return SizedBox(
                      height: Get.height / 2.2,
                      child: const Center(
                        child: Text('Belum ada transaksi'),
                      ),
                    );
                  } else {
                    return Obx(() => controller.isTransactionLoading.value ==
                            true
                        ? const TrxShimmer()
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.transactions.length,
                              itemBuilder: (context, index) {
                                var transaction =
                                    controller.transactions[index];
                                return GestureDetector(
                                  onLongPress: () {
                                    _bottomSheet(transaction, oCcy, controller);
                                  },
                                  child: Bounceable(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade900,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                            trailing: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 1),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    transaction.transactionType ==
                                                            "expense"
                                                        ? "- Rp ${oCcy.format(transaction.amount)}"
                                                        : "Rp ${oCcy.format(transaction.amount)}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    controller.formatDate(
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
                            ),
                          ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _bottomSheet(
      transaction, NumberFormat oCcy, AllTransactionController controller) {
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
                      controller.formatDate(transaction.createdTimestamp),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              )),
          Text(
              "Kuantitas: ${transaction.quantity.toString()} x ${oCcy.format(transaction.amount / transaction.quantity)}"),
          const SizedBox(height: 10),
          Text("Catatan: ${transaction.comment}"),
          const SizedBox(height: 10),
          Container(
            width: Get.width,
            height: 1,
            color: Colors.grey.shade700,
          ),
          const SizedBox(height: 10),
          InkWell(
              onTap: () => controller.deleteTransaction(),
              child: SizedBox(
                  width: Get.width,
                  child: const Text(
                    "Hapus",
                    style: TextStyle(color: Colors.red),
                  ))),
          const SizedBox(height: 10),
          InkWell(child: SizedBox(width: Get.width, child: const Text("Edit"))),
        ],
      ),
    ));
  }
}
