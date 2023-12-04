import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitPage extends StatelessWidget {
  SubmitPage({super.key});

  final listCategory = [
    "Medicine",
    "House",
    "Shopping",
    "Phone",
    "Coffee",
    "Pet",
    "Haircut",
    "Device",
    "Office"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Expenses",
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
            // Icon(Icons.swit)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    foregroundColor: Colors.white),
                onPressed: () {},
                child: const Text("Save")),
          )
        ],
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: Get.height * 0.9,
          child: Stack(
            children: [
              GridView.builder(
                shrinkWrap: true,
                itemCount: listCategory.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return Center(child: Text(listCategory[index]));
                },
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.green.shade900,
                  // height: 10,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Input Number',
                          // prefixIcon: Icon(Icons.),
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.6))),
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
}
