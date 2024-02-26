class PokemonStat {
  final int baseStat;
  final Status stat;

  const PokemonStat({
    required this.baseStat,
    required this.stat,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'base_stat': int baseStat,
        'stat': Map<String, dynamic> stat,
      } =>
        PokemonStat(baseStat: baseStat, stat: Status.fromJson(stat)),
      _ => throw const FormatException('Failed to load pokemon stat'),
    };
  }
}

class Status {
  final String name;
  final String url;

  const Status({
    required this.name,
    required this.url,
  });

  factory Status.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        Status(name: name, url: url),
      _ => throw const FormatException('Failed to load pokemon type'),
    };
  }
}
