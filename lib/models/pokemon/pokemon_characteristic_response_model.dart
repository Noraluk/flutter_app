import 'package:random_app/models/pokemon/pokemon_characteristic_description_model.dart';

class PokemonCharacteristicResponse {
  final List<PokemonCharacteristicDescription> descriptions;

  const PokemonCharacteristicResponse({
    required this.descriptions,
  });

  factory PokemonCharacteristicResponse.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'descriptions': List descriptions,
      } =>
        PokemonCharacteristicResponse(
          descriptions: List<PokemonCharacteristicDescription>.from(
            descriptions.map(
              (e) => PokemonCharacteristicDescription.fromJson(e),
            ),
          ),
        ),
      _ => throw const FormatException(
          'Failed to load pokemon characteristic description'),
    };
  }
}
