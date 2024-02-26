import 'package:random_app/models/pokemon/pokemon_move_type_model.dart';

class PokemonMoveResponse {
  final String name;
  final int? power;
  final int pp;
  final PokemonMoveType type;

  const PokemonMoveResponse({
    required this.name,
    this.power,
    required this.pp,
    required this.type,
  });

  factory PokemonMoveResponse.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'power': int? power,
        'pp': int pp,
        'type': Map<String, dynamic> type,
      } =>
        PokemonMoveResponse(
          name: name,
          power: power,
          pp: pp,
          type: PokemonMoveType.fromJson(type),
        ),
      _ => throw const FormatException('Failed to load pokemon move response'),
    };
  }
}
