class Ability {
  final String name;
  final String url;

  const Ability({
    required this.name,
    required this.url,
  });

  factory Ability.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'name': String name,
        'url': String url,
      } =>
        Ability(name: name, url: url),
      _ => throw const FormatException('Failed to load pokemon'),
    };
  }
}
