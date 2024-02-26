import 'package:random_app/models/pokemon/pokemon_evolution_detail_model.dart';
import 'package:random_app/models/pokemon/pokemon_species_model.dart';

class PokemonEvolvesTo {
  List<PokemonEvolutionDetails>? evolutionDetails;
  List<PokemonEvolvesTo>? evolvesTo;
  PokemonSpecies? species;

  PokemonEvolvesTo({this.evolutionDetails, this.evolvesTo, this.species});

  factory PokemonEvolvesTo.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'evolution_details': List evolutionDetails,
        'evolves_to': List evolvesTo,
        'species': Map<String, dynamic> species,
      } =>
        PokemonEvolvesTo(
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
      _ => throw const FormatException('Failed to load pokemon evolution to'),
    };
  }
}
