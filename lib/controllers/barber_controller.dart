import 'package:get/get.dart';

import '../models/barber_model.dart';
import '../services/barber_service.dart';

class BarberController extends GetxController {
  var isLoading = true.obs;
  var barberData = Rxn<BarberData>();

  final BarberService _service = BarberService();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      barberData.value = await _service.fetchBarberData();
    } finally {
      isLoading(false);
    }
  }
}
