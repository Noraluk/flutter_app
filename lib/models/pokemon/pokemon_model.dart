import 'package:random_app/models/pokemon/pokemon_ability_model.dart';
import 'package:random_app/models/pokemon/pokemon_moves_model.dart';
import 'package:random_app/models/pokemon/pokemon_sprite_model.dart';
import 'package:random_app/models/pokemon/pokemon_stat_model.dart';
import 'package:random_app/models/pokemon/pokemon_type_model.dart';

class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final List<PokemonAbility> abilities;
  final PokemonSprite sprites;
  final List<PokemonTypes> pokemonTypes;
  final List<PokemonStat> stats;
  final List<PokemonMoves> moves;

  const Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.sprites,
    required this.pokemonTypes,
    required this.stats,
    required this.moves,
  });

  factory Pokemon.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'id': int id,
        'name': String name,
        'base_experience': int baseExperience,
        'height': int height,
        'is_default': bool isDefault,
        'order': int order,
        'weight': int weight,
        'abilities': List abilities,
        'sprites': Map<String, dynamic> sprites,
        'types': List types,
        'stats': List stats,
        'moves': List moves,
      } =>
        Pokemon(
          id: id,
          name: name,
          baseExperience: baseExperience,
          height: height,
          isDefault: isDefault,
          order: order,
          weight: weight,
          abilities: List<PokemonAbility>.from(
            abilities.map(
              (e) => PokemonAbility.fromJson(e),
            ),
          ),
          sprites: PokemonSprite.fromJson(sprites),
          pokemonTypes: List<PokemonTypes>.from(
            types.map((e) => PokemonTypes.fromJson(e)),
          ),
          stats: List<PokemonStat>.from(
            stats.map(
              (e) => PokemonStat.fromJson(e),
            ),
          ),
          moves: List<PokemonMoves>.from(
            moves.map(
              (e) => PokemonMoves.fromJson(e),
            ),
          ),
        ),
      _ => throw const FormatException('Failed to load pokemon'),
    };
  }
}
