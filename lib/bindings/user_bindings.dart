import 'package:dio/dio.dart';
import 'package:dio_example/data/controller/user_controller.dart';
import 'package:get/get.dart';

class UserBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController(Dio()));
  }
}