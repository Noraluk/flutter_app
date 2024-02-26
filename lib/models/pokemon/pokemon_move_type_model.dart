class PokemonMoveType {
  final String name;
  final String url;

  const PokemonMoveType({
    required this.name,
    required this.url,
  });

  factory PokemonMoveType.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        PokemonMoveType(name: name, url: url),
      _ => throw const FormatException('Failed to load pokemon move'),
    };
  }
}
