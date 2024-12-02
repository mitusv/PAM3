import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/barber_model.dart';

class BarberService {
  Future<BarberData> fetchBarberData() async {
    final response = await rootBundle.loadString('src/v2.json');
    final data = json.decode(response);
    return BarberData.fromJson(data);
  }
}
