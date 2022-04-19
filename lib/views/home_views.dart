import 'package:flutter/material.dart';
import 'package:model_example/models/car.dart';
import 'package:model_example/views/content_views.dart';

class HomePageViews extends StatefulWidget {
  const HomePageViews({Key? key}) : super(key: key);

  @override
  State<HomePageViews> createState() => _HomePageViewsState();
}

class _HomePageViewsState extends State<HomePageViews> {
  List<Car> dataset = [
    Car(brand: 'BMW', color: 'Red'),
    Car(brand: 'Toyota', color: 'Silver'),
    Car(brand: 'Mercedes Benz', color: 'Black'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dataset.length,
                itemBuilder: (context, index) => SplashContent(
                  brand: dataset[index].brand,
                  color: dataset[index].color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
