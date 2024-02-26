import 'package:get/get.dart';
import 'package:random_app/controllers/pokemon/pokemon_detail_controller.dart';

class PokemonDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonDetailController(), fenix: true);
  }
}
