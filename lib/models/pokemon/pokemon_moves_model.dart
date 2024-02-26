import 'package:random_app/models/pokemon/pokemon_move_model.dart';

class PokemonMoves {
  final PokemonMove move;

  const PokemonMoves({
    required this.move,
  });

  factory PokemonMoves.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'move': Map<String, dynamic> move,
      } =>
        PokemonMoves(move: PokemonMove.fromJson(move)),
      _ => throw const FormatException('Failed to load pokemon moves'),
    };
  }
}
