import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/bindings/auth_bindings.dart';
import 'package:getx_example/views/login_views.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBindings(),
      home: const LoginPageViews(),
    );
  }
}
