import 'package:random_app/models/pokemon/pokemon_chain_model.dart';

class PokemonEvolutionChainResponse {
  PokemonChain chain;

  PokemonEvolutionChainResponse({
    required this.chain,
  });

  factory PokemonEvolutionChainResponse.fromJson(Map<String, dynamic> data) {
    return switch (data) {
      {
        'chain': Map<String, dynamic> chain,
      } =>
        PokemonEvolutionChainResponse(chain: PokemonChain.fromJson(chain)),
      _ => throw const FormatException(
          'Failed to load pokemon evolution chain response'),
    };
  }

  String? getFirstEvolutionName() {
    return chain.species?.name;
  }

  String? getSecondEvolutionName() {
    return chain.evolvesTo?[0].species?.name;
  }

  int? getSecondEvolutionLevel() {
    return chain.evolvesTo?[0].evolutionDetails?[0].minLevel;
  }

  String? getThirdEvolutionName() {
    return chain.evolvesTo?[0].evolvesTo?[0].species?.name;
  }

  int? getThirdEvolutionLevel() {
    return chain.evolvesTo?[0].evolvesTo?[0].evolutionDetails?[0].minLevel;
  }
}
