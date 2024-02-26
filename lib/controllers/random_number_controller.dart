import 'dart:math';

import 'package:get/get.dart';

class RandomNumberController extends GetxController {
  Random rng = Random();
  RxInt number = 0.obs;

  random() {
    number.value = rng.nextInt(100);
  }
}
