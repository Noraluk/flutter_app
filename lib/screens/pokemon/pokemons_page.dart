import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_app/constants/pokemon_constant.dart';
import 'package:random_app/controllers/pokemon/pokemons_controller.dart';
import 'package:random_app/models/pokemon/pokemon_type_model.dart';
import 'package:random_app/screens/pokemon/pokemon_detail_page.dart';

class PokemonsPage extends GetView<PokemonsController> {
  PokemonsPage({super.key});

  static const String route = '/pokemons';

  final List<String> categories = <String>['Pokemon'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pokedex',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => Expanded(
                  child: GridView.builder(
                      controller: controller.scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.pokemons.length,
                      itemBuilder: (BuildContext context, int i) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(
                            PokemonDetailPage.route.replaceFirst(
                              ":name",
                              controller.pokemons[i].name,
                            ),
                          ),
                          child: Card(
                            color: PokemonConstant.color[controller
                                .pokemons[i].pokemonTypes[0].type.name],
                            elevation: 2.5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: FractionallySizedBox(
                                      heightFactor: 0.65,
                                      child: Image.asset(
                                        'assets/images/pokemon-icon.png',
                                        color: Colors.white.withOpacity(0.25),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: FractionallySizedBox(
                                      heightFactor: 0.7,
                                      widthFactor: 0.7,
                                      child: Image.network(
                                        controller.pokemons[i].sprites.other
                                            .officialArtwork.frontDefault,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.pokemons[i].name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      for (PokemonTypes pokemonType
                                          in controller
                                              .pokemons[i].pokemonTypes)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 13, vertical: 3),
                                          margin:
                                              const EdgeInsets.only(bottom: 7),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.25),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Text(
                                            pokemonType.type.name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.clearFilter();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('FILTER'),
                  content: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('POKEMON NAME'),
                        TextFormField(
                          onChanged: (value) {
                            controller.changeName(value);
                          },
                          decoration: const InputDecoration(
                            hintText: "Name",
                            icon: Icon(Icons.catching_pokemon),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('POKEMON ELEMENT'),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              controller.pokemonElements.length,
                              (index) {
                                return Row(
                                  children: [
                                    Obx(
                                      () => GestureDetector(
                                        onTap: () =>
                                            controller.selectType(index),
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                controller
                                                    .pokemonElements[index]
                                                    .iconPath,
                                              ),
                                              if (controller
                                                  .pokemonElements[index]
                                                  .isSelected)
                                                Icon(
                                                  Icons.check_circle_rounded,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  size: 50,
                                                )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text("submit"),
                      onPressed: () {
                        controller.submitFilter();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/filter.png'),
        ),
      ),
    );
  }
}
