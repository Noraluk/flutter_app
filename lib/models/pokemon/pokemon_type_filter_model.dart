class PokemonElement {
  final String name;
  final String iconPath;
  bool isSelected;

  PokemonElement({
    required this.name,
    required this.iconPath,
    this.isSelected = false,
  });
}
