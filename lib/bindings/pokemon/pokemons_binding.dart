import 'package:get/get.dart';
import 'package:random_app/controllers/pokemon/pokemons_controller.dart';

class PokemonsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonsController(), fenix: true);
  }
}
