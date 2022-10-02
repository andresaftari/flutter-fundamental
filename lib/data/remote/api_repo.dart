import 'package:latihanbloc/data/covid.dart';
import 'package:latihanbloc/data/remote/api_service.dart';

class ApiRepo {
  final _service = ApiService();

  Future<Covid> getCovidList() => _service.getCovidData();
}
