import 'package:flutter/material.dart';
import 'package:latihanbloc/views/home/home_views.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const HomePageViews(),
    );
  }
}
