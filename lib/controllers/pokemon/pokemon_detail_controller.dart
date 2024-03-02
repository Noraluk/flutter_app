import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:random_app/models/pokemon/base_stat_model.dart';
import 'package:random_app/models/pokemon/pokemon_characteristic_response_model.dart';
import 'package:random_app/models/pokemon/pokemon_evolution_chain_response_model.dart';
import 'package:random_app/models/pokemon/pokemon_model.dart';
import 'package:random_app/models/pokemon/pokemon_move_response_model.dart';
import 'package:random_app/models/pokemon/pokemon_species_response._model.dart';
import 'package:random_app/services/pokemon/pokemon_service.dart';

class PokemonDetailController extends GetxController {
  RxBool isLoading = false.obs;

  Pokemon? pokemon;
  Pokemon? secondPokemonForm;
  Pokemon? thridPokemonForm;
  RxString personality = '???'.obs;
  PokemonSpeciesResponse? pokemonSpeciesResponse;
  BaseStat? baseStat;
  PokemonEvolutionChainResponse? pokemonEvolutionChainResponse;
  List<PokemonMoveResponse> pokemonMoves = <PokemonMoveResponse>[].obs;

  RxInt titleSelectedId = 0.obs;
  PageController pageController = PageController();

  @override
  Future<void> onInit() async {
    super.onInit();

    await fetchPokemon();
  }

  @override
  void onClose() {
    super.onClose();

    pageController.dispose();
  }

  fetchPokemon() async {
    try {
      isLoading(true);
      pokemon = await PokemonService.fetchPokemon(Get.parameters['name']!);

      PokemonCharacteristicResponse? characteristic =
          await PokemonService.fetchPokemonCharacteristic(pokemon!.id);
      if (characteristic != null) {
        personality.value = characteristic.descriptions
            .firstWhere((description) => description.language.name == 'en')
            .description;
      }

      pokemonSpeciesResponse =
          await PokemonService.fetchPokemonSpecies(pokemon!.id);
      baseStat = BaseStat(
        hp: pokemon!.stats
            .firstWhere((e) => e.stat.name.toLowerCase() == 'hp')
            .baseStat,
        attack: pokemon!.stats
            .firstWhere((e) => e.stat.name.toLowerCase() == 'attack')
            .baseStat,
        defense: pokemon!.stats
            .firstWhere((e) => e.stat.name.toLowerCase() == 'defense')
            .baseStat,
        spAtk: pokemon!.stats
            .firstWhere((e) => e.stat.name.toLowerCase() == 'special-attack')
            .baseStat,
        spDef: pokemon!.stats
            .firstWhere((e) => e.stat.name.toLowerCase() == 'special-defense')
            .baseStat,
        speed: pokemon!.stats
            .firstWhere((e) => e.stat.name.toLowerCase() == 'speed')
            .baseStat,
        total: pokemon!.stats
            .fold(0, (previous, current) => previous + current.baseStat),
      );

      if (pokemonSpeciesResponse!.evolutionChain.url != null) {
        pokemonEvolutionChainResponse =
            await PokemonService.fetchPokemonEvolutionChain(
                pokemonSpeciesResponse!.evolutionChain.url!);
        if (pokemonEvolutionChainResponse != null &&
            pokemonEvolutionChainResponse!.getSecondEvolutionName() != null) {
          secondPokemonForm = await PokemonService.fetchPokemon(
              pokemonEvolutionChainResponse!.getSecondEvolutionName()!);

          if (pokemonEvolutionChainResponse!.getThirdEvolutionName() != null) {
            thridPokemonForm = await PokemonService.fetchPokemon(
                pokemonEvolutionChainResponse!.getThirdEvolutionName()!);
          }
        }
      }

      for (final (i, m) in pokemon!.moves.indexed) {
        PokemonMoveResponse? pokemonMoveResponse =
            await PokemonService.fetchPokemonMove(m.move.url);
        if (pokemonMoveResponse != null) {
          pokemonMoves.add(pokemonMoveResponse);
        }
        if (i == 10) {
          break;
        }
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }

  setTitleSelectedId(int id) {
    titleSelectedId(id);
    pageController.jumpToPage(id);
  }

  handlePageChanged(int currentPageIndex) {
    titleSelectedId(currentPageIndex);
  }
}
