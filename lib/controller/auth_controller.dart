import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var hasLogin = false.obs; // Memastikan user udah login atau belom?
  var isHidden = true.obs; // Memastikan password ketutup atau ga?

  // Untuk ngambil input dari user
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Toggle hide or display password
  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  // API memberikan status code == 200, karena statis sekarang dibuat manual
  void isAlreadyLogin() {
    hasLogin.value = !hasLogin.value;

    if (hasLogin.value) {
      Get.snackbar('Login', 'Welcome back!');
    }
  }
}