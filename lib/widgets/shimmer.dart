import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade900,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
        ));
  }
}

class TrxShimmer extends StatelessWidget {
  const TrxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: List.generate(
        4,
        (index) => Padding(
          padding: EdgeInsets.fromLTRB(2, 0, 2, 5),
          child: Skeleton(width: Get.width, height: 70),
        ),
      )),
    );
  }
}

class TotalBalanceShimmer extends StatelessWidget {
  const TotalBalanceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeleton(width: 100, height: 50);
  }
}

class InExShimmer extends StatelessWidget {
  const InExShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeleton(width: 100, height: 20);
  }
}
