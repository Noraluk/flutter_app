class PokemonMove {
  final String name;
  final String url;

  const PokemonMove({
    required this.name,
    required this.url,
  });

  factory PokemonMove.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        PokemonMove(name: name, url: url),
      _ => throw const FormatException('Failed to load pokemon move'),
    };
  }
}
