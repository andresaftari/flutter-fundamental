import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:latihanbloc/data/covid.dart';
import 'package:latihanbloc/utils/constant.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Covid> getCovidData() async {
    try {
      final response = await _dio.getUri(
        Uri.https(baseURL, getCovidDataURL),
      );

      if (response.statusCode == 200) {
        return Covid.fromJson(response.data);
      } else {
        log('${response.statusCode}', name: 'getCovidData');
        return Covid.fromJson(response.data);
      }
    } catch (ex, stack) {
      log('Failed! $ex, stacktrace: $stack', name: 'getCovidData');
      return Covid.withError(ex.toString());
    }
  }
}
