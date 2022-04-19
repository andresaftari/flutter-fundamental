import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testdb/data/controller/db_helpers.dart';
import 'package:testdb/data/model/db_model.dart';

class DBController extends GetxController {
  var dbModel = List<DBModel>.empty(growable: true).obs;
  TextEditingController dbTextEditingController = TextEditingController();

  @override
  void onInit() {
    _getData();
    super.onInit();
  }

  void getLast() {
    DBHelpers.instance.queryAllRows().then(
      (value) {
        log('${value.last}', name: 'lastValue');
      },
    );
  }

  void _getData() {
    DBHelpers.instance.queryAllRows().then((models) {
      for (var element in models) {
        dbModel.add(
          DBModel(
            element['id'],
            name: element['name'],
          ),
        );
      }
    });
  }

  void addData() async {
    await DBHelpers.instance.insert(
      DBModel(0, name: dbTextEditingController.text),
    );
    dbModel.insert(
      0,
      DBModel(dbModel.length, name: dbTextEditingController.text),
    );
    dbTextEditingController.clear();
  }

  void deleteTask(int id) async {
    await DBHelpers.instance.delete(id);
    dbModel.removeWhere((element) => element.id == id);
  }
}
