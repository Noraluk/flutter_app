import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt tabSelectedId = 0.obs;

  setTabSelectedId(int id) => tabSelectedId(id);
}
