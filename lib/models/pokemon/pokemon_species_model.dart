class PokemonSpecies {
  final String name;
  final String url;

  const PokemonSpecies({
    required this.name,
    required this.url,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        PokemonSpecies(name: name, url: url),
      _ => throw const FormatException('Failed to load pokemon species'),
    };
  }
}
