import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_example/data/domain/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Dio _dio;

  UserController(this._dio);

  Future<User> getUsers() async {
    var res;

    final response = await _dio.getUri(
      Uri.https('api.github.com', '/users/andresaftari'),
    );

    try {
      if (response.statusCode == 200) {
        log('Fetch user success', name: 'Fetch User');
        var user = User.fromJson(response.data);

        res = user;
        return user;
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } catch (e) {
      log('Failed to fetch user: $e', name: 'Fetch User');
    }

    return res;
  }
}
