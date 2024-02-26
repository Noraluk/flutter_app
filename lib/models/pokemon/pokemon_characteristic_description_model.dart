class PokemonCharacteristicDescription {
  final String description;
  final PokemonCharacteristicDescriptionLanguage language;

  const PokemonCharacteristicDescription({
    required this.description,
    required this.language,
  });

  factory PokemonCharacteristicDescription.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'description': String description,
        'language': Map<String, dynamic> language,
      } =>
        PokemonCharacteristicDescription(
          description: description,
          language: PokemonCharacteristicDescriptionLanguage.fromJson(language),
        ),
      _ => throw const FormatException(
          'Failed to load pokemon characteristic description'),
    };
  }
}

class PokemonCharacteristicDescriptionLanguage {
  final String name;
  final String url;

  const PokemonCharacteristicDescriptionLanguage({
    required this.name,
    required this.url,
  });

  factory PokemonCharacteristicDescriptionLanguage.fromJson(
      Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        PokemonCharacteristicDescriptionLanguage(
          name: name,
          url: url,
        ),
      _ => throw const FormatException(
          'Failed to load pokemon characteristic description language'),
    };
  }
}
