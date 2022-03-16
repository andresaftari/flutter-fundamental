import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/auth_controller.dart';

class HomePageViews extends StatefulWidget {
  const HomePageViews({Key? key}) : super(key: key);

  @override
  State<HomePageViews> createState() => _HomePageViewsState();
}

class _HomePageViewsState extends State<HomePageViews> {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello, ${_authController.usernameController.text}',
              style: const TextStyle(fontSize: 32),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _authController.isAlreadyLogin();
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
