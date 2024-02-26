class PokemonTypes {
  final int slot;
  final PokemonType type;

  const PokemonTypes({
    required this.slot,
    required this.type,
  });

  factory PokemonTypes.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'slot': int slot,
        'type': Map<String, dynamic> type,
      } =>
        PokemonTypes(slot: slot, type: PokemonType.fromJson(type)),
      _ => throw const FormatException('Failed to load pokemon types'),
    };
  }
}

class PokemonType {
  final String name;
  final String url;

  const PokemonType({
    required this.name,
    required this.url,
  });

  factory PokemonType.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        PokemonType(name: name, url: url),
      _ => throw const FormatException('Failed to load pokemon type'),
    };
  }
}
