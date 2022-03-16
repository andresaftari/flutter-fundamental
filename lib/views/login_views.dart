import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/auth_controller.dart';
import 'package:getx_example/views/home_views.dart';

class LoginPageViews extends StatefulWidget {
  const LoginPageViews({Key? key}) : super(key: key);

  @override
  State<LoginPageViews> createState() => _LoginPageViewsState();
}

class _LoginPageViewsState extends State<LoginPageViews> {
  final AuthController _authController = Get.find();
  final _loginFormKey = GlobalKey<FormState>(debugLabel: 'Login');

  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX State-Management'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Obx(
          () => _authController.hasLogin.value
              ? const HomePageViews()
              : buildLoginComponent(context),
        ),
      ),
    );
  }

  Widget buildLoginComponent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text(
              'Login with your account here!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),
            Form(
              key: _loginFormKey,
              child: Container(
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                child: Column(
                  children: [
                    buildUsernameForm(),
                    const SizedBox(height: 16),
                    buildPasswordForm(),
                    const SizedBox(height: 34),
                    buildLoginButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUsernameForm() {
    return TextFormField(
      controller: _authController.usernameController,
      textAlign: TextAlign.start,
      cursorColor: Colors.black,
      validator: (val) => val!.isEmpty ? 'Username cannot be ignored' : null,
      style: const TextStyle(color: Colors.black),
      onChanged: (value) => username = value,
      decoration: const InputDecoration(
        hintText: 'Username',
        hintStyle: TextStyle(color: Colors.blueAccent),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        filled: true,
      ),
    );
  }

  Widget buildPasswordForm() {
    return TextFormField(
      // Fungsinya untuk nutupin
      obscureText: _authController.isHidden.value,
      controller: _authController.passwordController,
      textAlign: TextAlign.start,
      cursorColor: Colors.black,
      validator: (val) => val!.isEmpty ? 'Password cannot be ignored' : null,
      style: const TextStyle(color: Colors.black),
      onChanged: (value) => password = value,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.blueAccent),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        filled: true,
        suffixIcon: Obx(
          () => GestureDetector(
            onTap: () => _authController.togglePassword(),
            child: _authController.isHidden.value
                ? const Icon(CupertinoIcons.eye_slash_fill, color: Colors.grey)
                : const Icon(CupertinoIcons.eye_solid, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_loginFormKey.currentState!.validate()) {
            _authController.isAlreadyLogin();

            Get.to(() => const HomePageViews());
          }
        },
        child: const Text(
          'LOGIN',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
