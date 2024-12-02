import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/barber_shop_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'Barber Shop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarberShopScreen(),
    );
  }
}
