import 'package:dio_example/bindings/user_bindings.dart';
import 'package:dio_example/views/home_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: UserBindings(),
      home: const HomePageViews(),
    );
  }
}