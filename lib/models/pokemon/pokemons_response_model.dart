import 'package:random_app/models/pokemon/pokemon_result_model.dart';

class PokemonsResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonResult> pokemons;

  const PokemonsResponse({
    required this.count,
    this.next,
    this.previous,
    required this.pokemons,
  });

  factory PokemonsResponse.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'count': int count,
        'next': String? next,
        'previous': String? previous,
        'results': List results,
      } =>
        PokemonsResponse(
          count: count,
          next: next,
          previous: previous,
          pokemons: List<PokemonResult>.from(
            results.map(
              (e) => PokemonResult.fromJson(e),
            ),
          ),
        ),
      _ => throw const FormatException('Failed to load pokemons response'),
    };
  }
}
