class PokemonSpeciesHabitat {
  final String name;
  final String url;

  const PokemonSpeciesHabitat({
    required this.name,
    required this.url,
  });

  factory PokemonSpeciesHabitat.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        PokemonSpeciesHabitat(name: name, url: url),
      _ => throw const FormatException('Failed to load pokemon habitat'),
    };
  }
}
