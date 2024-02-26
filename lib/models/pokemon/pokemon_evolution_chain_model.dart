class PokemonEvolutionChain {
  final String? url;

  const PokemonEvolutionChain({
    this.url,
  });

  factory PokemonEvolutionChain.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'url': String? url,
      } =>
        PokemonEvolutionChain(url: url),
      _ =>
        throw const FormatException('Failed to load pokemon evolution chain'),
    };
  }
}
