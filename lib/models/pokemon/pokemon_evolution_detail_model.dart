class PokemonEvolutionDetails {
  int? minLevel;

  PokemonEvolutionDetails({
    this.minLevel,
  });

  factory PokemonEvolutionDetails.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'min_level': int? minLevel,
      } =>
        PokemonEvolutionDetails(minLevel: minLevel),
      _ =>
        throw const FormatException('Failed to load pokemon evolution details'),
    };
  }
}
