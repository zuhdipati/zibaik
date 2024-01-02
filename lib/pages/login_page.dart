import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

final _formKey = GlobalKey<FormBuilderState>();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Log in to your account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                "Welcome back! please enter your details.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 20),
              FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    FormBuilderTextField(
                      name: 'email',
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        label: const Text("Masukkan email anda"),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        // errorText: 'Email tidak boleh kosong',
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
                        print(val);
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text("Password",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    FormBuilderTextField(
                      name: 'password',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        label: const Text("Masukkan password anda"),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        // errorText: 'Email tidak boleh kosong',
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
                        print(val);
                      },
                    ),
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
