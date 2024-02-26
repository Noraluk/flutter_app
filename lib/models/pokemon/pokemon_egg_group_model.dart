class PokemonEggGroup {
  final String name;
  final String url;

  const PokemonEggGroup({
    required this.name,
    required this.url,
  });

  factory PokemonEggGroup.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        PokemonEggGroup(name: name, url: url),
      _ => throw const FormatException('Failed to load pokemon egg group'),
    };
  }
}
