import 'package:flutter/material.dart';

enum Brand { All, APPLE, SAMSUNG, HWAWEI, XIAOMI, OPPO, ASSUS }

class Watch {
  final String name;
  final String image;
  final Color color;
  Watch({
    required this.name,
    required this.image,
    required this.color,
  });
}

final watches = [
  Watch(
      name: 'Apple Series 5',
      image: 'assets/images/apple_series_5.png',
      color: Colors.black),
  Watch(
      name: 'Apple Series 5',
      image: 'assets/images/apple_series_5.png',
      color: Colors.red),
  Watch(
      name: 'Apple Series 5',
      image: 'assets/images/apple_series_5.png',
      color: Colors.green),
];
