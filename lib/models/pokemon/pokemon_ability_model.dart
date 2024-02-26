import 'package:random_app/models/pokemon/ability_model.dart';

class PokemonAbility {
  final bool isHidden;
  final int slot;
  final Ability ability;

  const PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'is_hidden': bool isHidden,
        'slot': int slot,
        'ability': Map<String, dynamic> ability,
      } =>
        PokemonAbility(
          isHidden: isHidden,
          slot: slot,
          ability: Ability.fromJson(ability),
        ),
      _ => throw const FormatException('Failed to load pokemon'),
    };
  }
}
