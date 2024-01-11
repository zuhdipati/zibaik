import 'package:flutter/material.dart';
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
        (index) => const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Skeleton(
                    height: 45,
                    width: 45,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(width: 100, height: 15),
                      SizedBox(height: 3),
                      Skeleton(width: 80, height: 15),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Skeleton(width: 150, height: 15),
                  SizedBox(height: 3),
                  Skeleton(width: 150, height: 15),
                ],
              )
            ],
          ),
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
