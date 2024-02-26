import 'package:random_app/models/pokemon/pokemon_evolution_detail_model.dart';
import 'package:random_app/models/pokemon/pokemon_evolution_to_model.dart';
import 'package:random_app/models/pokemon/pokemon_species_model.dart';

class PokemonChain {
  List<PokemonEvolutionDetails>? evolutionDetails;
  List<PokemonEvolvesTo>? evolvesTo;
  PokemonSpecies? species;

  PokemonChain({
    this.evolutionDetails,
    this.evolvesTo,
    this.species,
  });

  factory PokemonChain.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'evolution_details': List evolutionDetails,
        'evolves_to': List evolvesTo,
        'species': Map<String, dynamic> species,
      } =>
        PokemonChain(
          evolutionDetails: List<PokemonEvolutionDetails>.from(
            evolutionDetails.map(
              (e) => PokemonEvolutionDetails.fromJson(e),
            ),
          ),
          evolvesTo: List<PokemonEvolvesTo>.from(
            evolvesTo.map(
              (e) => PokemonEvolvesTo.fromJson(e),
            ),
          ),
          species: PokemonSpecies.fromJson(species),
        ),
      _ => throw const FormatException('Failed to load pokemon chain'),
    };
  }
}
