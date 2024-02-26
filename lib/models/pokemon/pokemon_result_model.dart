class PokemonResult {
  final String name;
  final String url;

  const PokemonResult({
    required this.name,
    required this.url,
  });

  factory PokemonResult.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        PokemonResult(name: name, url: url),
      _ => throw const FormatException('Failed to load pokemon result'),
    };
  }
}
