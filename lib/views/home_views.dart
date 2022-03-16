import 'dart:developer';

import 'package:dio_example/data/controller/user_controller.dart';
import 'package:dio_example/data/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageViews extends StatefulWidget {
  const HomePageViews({Key? key}) : super(key: key);

  @override
  State<HomePageViews> createState() => _HomePageViewsState();
}

class _HomePageViewsState extends State<HomePageViews> {
  final UserController _userController = Get.find();

  @override
  void initState() {
    _userController.getUsers().then((value) {
      log('Check data: $value', name: 'onViews');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Example'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: buildUserData(context)),
    );
  }

  Container buildUserData(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      height: double.infinity,
      child: FutureBuilder<User>(
        future: _userController.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return Center(
                child: Column(
                  children: [
                    Image.network(
                      snapshot.data!.avatarUrl,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'github.com/${snapshot.data!.login}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      snapshot.data!.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      snapshot.data!.company,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return const Center(
              child: Text('No user data, check your internet!'),
            );
          }
        },
      ),
    );
  }
}
