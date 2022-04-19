import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdb/data/controller/db_controller.dart';

class HomePageViews extends StatelessWidget {
  final DBController _dbController = Get.put(DBController());

  HomePageViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DB Example")),
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _dbController.dbTextEditingController,
                    decoration: const InputDecoration(hintText: 'Enter a task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _dbController.addData();
                    _dbController.getLast();
                  },
                )
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _dbController.dbModel.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Text(_dbController.dbModel[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _dbController.deleteTask(
                        _dbController.dbModel[index].id,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
