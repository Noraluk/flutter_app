class PokemonSprite {
  final String frontDefault;
  final String frontShiny;
  final String? frontFemale;
  final String? frontShinyFemale;
  final String backDefault;
  final String backShiny;
  final String? backFemale;
  final String? backShinyFemale;
  final OtherPokemonSprite other;

  const PokemonSprite({
    required this.frontDefault,
    required this.frontShiny,
    required this.frontFemale,
    required this.frontShinyFemale,
    required this.backDefault,
    required this.backShiny,
    required this.backFemale,
    required this.backShinyFemale,
    required this.other,
  });

  factory PokemonSprite.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'front_default': String frontDefault,
        'front_shiny': String frontShiny,
        'front_female': String? frontFemale,
        'front_shiny_female': String? frontShinyFemale,
        'back_default': String backDefault,
        'back_shiny': String backShiny,
        'back_female': String? backFemale,
        'back_shiny_female': String? backShinyFemale,
        'other': Map<String, dynamic> other,
      } =>
        PokemonSprite(
          frontDefault: frontDefault,
          frontShiny: frontShiny,
          frontFemale: frontFemale,
          frontShinyFemale: frontShinyFemale,
          backDefault: backDefault,
          backShiny: backShiny,
          backFemale: backFemale,
          backShinyFemale: backShinyFemale,
          other: OtherPokemonSprite.fromJson(other),
        ),
      _ => throw const FormatException('Failed to load pokemon sprite'),
    };
  }
}

class OtherPokemonSprite {
  final OtherPokemonSpriteHome home;
  final OtherPokemonSpriteOfficialArtwork officialArtwork;

  const OtherPokemonSprite({
    required this.home,
    required this.officialArtwork,
  });

  factory OtherPokemonSprite.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'home': Map<String, dynamic> home,
        'official-artwork': Map<String, dynamic> officialArtwork,
      } =>
        OtherPokemonSprite(
          home: OtherPokemonSpriteHome.fromJson(home),
          officialArtwork: OtherPokemonSpriteOfficialArtwork.fromJson(
            officialArtwork,
          ),
        ),
      _ => throw const FormatException('Failed to load other pokemon sprite'),
    };
  }
}

class OtherPokemonSpriteHome {
  final String frontDefault;
  final String? frontFemale;
  final String frontShiny;
  final String? frontShinyFemale;

  const OtherPokemonSpriteHome({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory OtherPokemonSpriteHome.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'front_default': String frontDefault,
        'front_female': String? frontFemale,
        'front_shiny': String frontShiny,
        'front_shiny_female': String? frontShinyFemale,
      } =>
        OtherPokemonSpriteHome(
          frontDefault: frontDefault,
          frontShiny: frontShiny,
          frontFemale: frontFemale,
          frontShinyFemale: frontShinyFemale,
        ),
      _ =>
        throw const FormatException('Failed to load other pokemon sprite home'),
    };
  }
}

class OtherPokemonSpriteOfficialArtwork {
  final String frontDefault;
  final String frontShiny;

  const OtherPokemonSpriteOfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OtherPokemonSpriteOfficialArtwork.fromJson(
      Map<String, dynamic> data) {
    return switch (data) {
      {
        'front_default': String frontDefault,
        'front_shiny': String frontShiny,
      } =>
        OtherPokemonSpriteOfficialArtwork(
          frontDefault: frontDefault,
          frontShiny: frontShiny,
        ),
      _ => throw const FormatException(
          'Failed to load other pokemon sprite official artwork'),
    };
  }
}
