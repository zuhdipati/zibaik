import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:manajemen_keuangan/controllers/auth_controller.dart';
import 'package:manajemen_keuangan/core/app_routes.dart';

final _formKey = GlobalKey<FormState>();

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: Get.height / 1.05,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "Create an account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Welcome! please enter your details.",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(height: Get.height / 14),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const Text("Name",
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold)),
                          // const SizedBox(height: 10),
                          // TextFormField(
                          //   cursorColor: Colors.white,
                          //   style: const TextStyle(
                          //       color: Colors.white, fontSize: 18),
                          //   validator: (value) {
                          //     return value == null || value.isEmpty
                          //         ? 'Please fill the name'
                          //         : !controller.noSpecialCharacter
                          //                 .hasMatch(value)
                          //             ? 'Name cannot contain special characters'
                          //             : null;
                          //   },
                          //   decoration: InputDecoration(
                          //     label: const Text("Enter your name"),
                          //     floatingLabelBehavior:
                          //         FloatingLabelBehavior.never,
                          //     labelStyle: TextStyle(
                          //         color: Colors.white.withOpacity(0.5),
                          //         fontSize: 17,
                          //         fontWeight: FontWeight.w100),
                          //     filled: true,
                          //     fillColor: Colors.grey.shade700,
                          //     contentPadding: const EdgeInsets.symmetric(
                          //         horizontal: 10, vertical: 12),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(12),
                          //       borderSide:
                          //           const BorderSide(color: Colors.white),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(12),
                          //       borderSide:
                          //           const BorderSide(color: Colors.white),
                          //     ),
                          //     errorBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(12),
                          //       borderSide: const BorderSide(color: Colors.red),
                          //     ),
                          //     prefixIcon: Padding(
                          //       padding: const EdgeInsets.all(12),
                          //       child: SvgPicture.asset(
                          //         'assets/user.svg',
                          //         width: 15,
                          //         height: 15,
                          //         color: Colors.white.withOpacity(0.5),
                          //       ),
                          //     ),
                          //   ),
                          //   onChanged: (val) {
                          //     debugPrint(val);
                          //   },
                          // ),
                          // const SizedBox(height: 20),
                          const Text("Email",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: controller.email,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            validator: (value) {
                              return value == null ||
                                      value.isEmpty ||
                                      !value.contains("@")
                                  ? 'Invalid email'
                                  : null;
                            },
                            decoration: InputDecoration(
                              label: const Text("Enter your email"),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w100),
                              filled: true,
                              fillColor: Colors.grey.shade700,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/email.svg',
                                  width: 15,
                                  height: 15,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              debugPrint(val);
                            },
                          ),
                          const SizedBox(height: 20),
                          const Text("Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: controller.password,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            cursorColor: Colors.white,
                            validator: (value) {
                              return value == null ||
                                      value.isEmpty ||
                                      value.length < 6
                                  ? 'Password must be at least 6 characters'
                                  : !controller.noSpecialCharacter
                                          .hasMatch(value)
                                      ? 'Password cannot contain special characters'
                                      : null;
                            },
                            decoration: InputDecoration(
                              label: const Text("Enter your password"),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade700,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/lock.svg',
                                  width: 15,
                                  height: 15,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/eye-crossed.svg',
                                  width: 15,
                                  height: 15,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              debugPrint(val);
                            },
                          ),
                          const SizedBox(height: 20),
                          Bounceable(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                controller.register();
                              }
                            },
                            child: Container(
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(
                                      colors: [Colors.purple, Colors.pink])),
                              child:Obx(() => Center(
                                child: controller.isLoading.value == true
                                    ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))
                                    : const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: Get.width,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/google.png',
                                    width: 40, height: 40),
                                const Text(
                                  "Sign Up with Google",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Get.height / 10),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(color: Colors.white.withOpacity(0.5))),
                    TextButton(
                      onPressed: () => Get.offAndToNamed(Routes.login),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8)),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
