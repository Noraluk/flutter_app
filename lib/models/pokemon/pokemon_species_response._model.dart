import 'package:random_app/models/pokemon/pokemon_egg_group_model.dart';
import 'package:random_app/models/pokemon/pokemon_evolution_chain_model.dart';
import 'package:random_app/models/pokemon/pokemon_species_habitat_model.dart';

class PokemonSpeciesResponse {
  final int genderRate;
  final List<PokemonEggGroup> eggGroups;
  final PokemonSpeciesHabitat habitat;
  final PokemonEvolutionChain evolutionChain;

  const PokemonSpeciesResponse({
    required this.genderRate,
    required this.eggGroups,
    required this.habitat,
    required this.evolutionChain,
  });

  factory PokemonSpeciesResponse.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'gender_rate': int genderRate,
        'egg_groups': List eggGroups,
        'habitat': Map<String, dynamic> habitat,
        'evolution_chain': Map<String, dynamic> evolutionChain,
      } =>
        PokemonSpeciesResponse(
          genderRate: genderRate,
          eggGroups: List<PokemonEggGroup>.from(
            eggGroups.map(
              (e) => PokemonEggGroup.fromJson(e),
            ),
          ),
          habitat: PokemonSpeciesHabitat.fromJson(habitat),
          evolutionChain: PokemonEvolutionChain.fromJson(evolutionChain),
        ),
      _ => throw const FormatException('Failed to load pokemon result'),
    };
  }
}
