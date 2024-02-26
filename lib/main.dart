import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_app/bindings/pokemon/pokemon_detail_binding.dart';
import 'package:random_app/bindings/pokemon/pokemons_binding.dart';
import 'package:random_app/screens/pokemon/pokemons_page.dart';
import 'package:random_app/screens/pokemon/pokemon_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Neuzeit-Office'),
      getPages: [
        GetPage(
          name: PokemonsPage.route,
          page: () => PokemonsPage(),
          binding: PokemonsBinding(),
        ),
        GetPage(
          name: PokemonDetailPage.route,
          page: () => PokemonDetailPage(),
          binding: PokemonDetailBinding(),
          preventDuplicates: false,
        ),
      ],
      initialRoute: PokemonsPage.route,
    );
  }
}
