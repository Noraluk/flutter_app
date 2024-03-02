import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_app/constants/pokemon_constant.dart';
import 'package:random_app/controllers/pokemon/pokemon_detail_controller.dart';
import 'package:random_app/models/pokemon/pokemon_model.dart';

class PokemonDetailPage extends GetView<PokemonDetailController> {
  PokemonDetailPage({super.key});

  static const String route = '/pokemons/:name';

  final Map<String, Color> m = {
    'normal': const Color(0xFFA8A77A),
    'fire': const Color(0xFFEE8130),
    'water': const Color(0xFF6390F0),
    'electric': const Color(0xFFF7D02C),
    'grass': const Color(0xFF7AC74C),
    'ice': const Color(0xFF96D9D6),
    'fighting': const Color(0xFFC22E28),
    'poison': const Color(0xFFA33EA1),
    'ground': const Color(0xFFE2BF65),
    'flying': const Color(0xFFA98FF3),
    'psychic': const Color(0xFFF95587),
    'bug': const Color(0xFFA6B91A),
    'rock': const Color(0xFFB6A136),
    'ghost': const Color(0xFF735797),
    'dragon': const Color(0xFF6F35FC),
    'dark': const Color(0xFF705746),
    'steel': const Color(0xFFB7B7CE),
    'fairy': const Color(0xFFD685AD),
  };

  final Map<String, List<Color>> bgColor = {
    'normal': [const Color(0xFFB0A485), const Color(0xFFC3B8A0)],
    'fire': [const Color(0xFFF1B366), const Color(0xFFE6612C)],
    'water': [const Color(0xFF74CCF4), const Color(0xFF3788E9)],
    'electric': [const Color(0xFFFBE96E), const Color(0xFFF1BC33)],
    'grass': [const Color(0xFFA8E36F), const Color(0xFF4AB143)],
    'ice': [const Color(0xFF74CCF4), const Color(0xFF3889E9)],
    'fighting': [const Color(0xFFB36157), const Color(0xFF7D322D)],
    'poison': [const Color(0xFFCB84CF), const Color(0xFF8440A0)],
    'ground': [const Color(0xFFD6C388), const Color(0xFFB8914B)],
    'flying': [const Color(0xFFB3D1F7), const Color(0xFF7AA0F2)],
    'psychic': [const Color(0xFFF7A9BB), const Color(0xFFF35284)],
    'bug': [const Color(0xFFC1CD5F), const Color(0xFF859C2A)],
    'rock': [const Color(0xFFBBA181), const Color(0xFF926746)],
    'ghost': [const Color(0xFFA88ACD), const Color(0xFF65549D)],
    'dragon': [const Color(0xFF7A87E8), const Color(0xFF65549D)],
    'dark': [const Color(0xFF746461), const Color(0xFF433737)],
    'steel': [const Color(0xFFCAC9D4), const Color(0xFF8B88A7)],
    'fairy': [const Color(0xFFFBC7F3), const Color(0xFFF88DE9)],
  };

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              backgroundColor: controller.isLoading.value
                  ? Colors.white
                  : PokemonConstant
                      .color[controller.pokemon!.pokemonTypes[0].type.name]!,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => debugPrint('save favorite'),
                        child: const Icon(
                          Icons.favorite_border_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                scrolledUnderElevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.pokemon!.name.capitalizeFirst!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: List.generate(
                                  controller.pokemon!.pokemonTypes.length,
                                  (index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  margin: const EdgeInsets.only(right: 7),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        PokemonConstant.typeIcon[controller
                                            .pokemon!
                                            .pokemonTypes[index]
                                            .type
                                            .name]!,
                                        height: 25,
                                        width: 25,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        controller.pokemon!.pokemonTypes[index]
                                            .type.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        Text(
                          '#${controller.pokemon!.id.toString().padLeft(3, '0')}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      Image.network(
                        controller.pokemon!.sprites.other.officialArtwork
                            .frontDefault,
                        height: 300.0,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              PokemonTitle(title: 'About', id: 0),
                              PokemonTitle(title: 'Base Stats', id: 1),
                              PokemonTitle(title: 'Evolution', id: 2),
                              PokemonTitle(title: 'Moves', id: 3),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Expanded(
                            child: PageView(
                              controller: controller.pageController,
                              onPageChanged: controller.handlePageChanged,
                              children: [
                                PokemonAbout(),
                                PokemonBaseStat(),
                                PokemonEvolution(),
                                PokemonMoves(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
    // return Obx(
    //   () => controller.isLoading.value
    //       ? const Center(child: CircularProgressIndicator())
    //       : Container(
    //           decoration: BoxDecoration(
    //             gradient: LinearGradient(
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight,
    //               colors: [
    //                 bgColor[controller.pokemon!.pokemonTypes[0].type.name]![0],
    //                 bgColor[controller.pokemon!.pokemonTypes[0].type.name]![1],
    //               ],
    //             ),
    //           ),
    //           child: Scaffold(
    //             backgroundColor: Colors.transparent,
    //             appBar: AppBar(
    //               automaticallyImplyLeading: false,
    //               leadingWidth: 40,
    //               leading: IconButton(
    //                 onPressed: () => Get.back(),
    //                 icon: const Icon(Icons.arrow_back_ios_new_rounded),
    //               ),
    //               scrolledUnderElevation: 0.0,
    //               backgroundColor: Colors.transparent,
    //             ),
    //             body: SafeArea(
    //               child: SizedBox(
    //                 width: MediaQuery.of(context).size.width,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Align(
    //                       alignment: Alignment.topLeft,
    //                       child: Padding(
    //                         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
    //                         child: Text(
    //                           '${Random().nextInt(2400) + 600} CP',
    //                           style: const TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 35.0,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Image.network(
    //                       controller.pokemon!.sprites.other.officialArtwork
    //                           .frontDefault,
    //                       height: 300.0,
    //                     ),
    //                     Text(
    //                       controller.pokemon!.name.capitalizeFirst!,
    //                       style: const TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 40.0,
    //                         fontWeight: FontWeight.w900,
    //                       ),
    //                     ),
    //                     const Padding(padding: EdgeInsets.all(1)),
    //                     Padding(
    //                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //                       child: Container(
    //                         width: MediaQuery.of(context).size.width,
    //                         color: Colors.white.withOpacity(0.3),
    //                         padding: const EdgeInsets.symmetric(
    //                             horizontal: 30.0, vertical: 20.0),
    //                         child: Column(
    //                           children: [
    //                             Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Column(
    //                                   children: [
    //                                     Text(
    //                                       '${controller.pokemon!.weight} KG',
    //                                       style: const TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 25.0,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                     const Text(
    //                                       'WEIGHT',
    //                                       style: TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 12.0,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 Row(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceAround,
    //                                   children: controller.pokemon!.pokemonTypes
    //                                       .asMap()
    //                                       .entries
    //                                       .map((e) {
    //                                     if (e.key == 0) {
    //                                       return Column(
    //                                         children: [
    //                                           Container(
    //                                             width: 30.0,
    //                                             height: 30.0,
    //                                             decoration: BoxDecoration(
    //                                               shape: BoxShape.circle,
    //                                               color: m[controller
    //                                                   .pokemon!
    //                                                   .pokemonTypes[e.key]
    //                                                   .type
    //                                                   .name],
    //                                             ),
    //                                           ),
    //                                           const SizedBox(height: 5),
    //                                           Text(
    //                                             controller
    //                                                 .pokemon!
    //                                                 .pokemonTypes[e.key]
    //                                                 .type
    //                                                 .name
    //                                                 .toUpperCase(),
    //                                             style: const TextStyle(
    //                                               color: Colors.white,
    //                                               fontSize: 12.0,
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       );
    //                                     }
    //                                     return Column(
    //                                       children: [
    //                                         Container(
    //                                           margin: const EdgeInsets.fromLTRB(
    //                                               15, 0, 0, 0),
    //                                           width: 30.0,
    //                                           height: 30.0,
    //                                           decoration: BoxDecoration(
    //                                             shape: BoxShape.circle,
    //                                             color: m[controller
    //                                                 .pokemon!
    //                                                 .pokemonTypes[e.key]
    //                                                 .type
    //                                                 .name],
    //                                           ),
    //                                         ),
    //                                         const SizedBox(height: 5),
    //                                         Text(
    //                                           '/${controller.pokemon!.pokemonTypes[e.key].type.name.toUpperCase()}',
    //                                           style: const TextStyle(
    //                                             color: Colors.white,
    //                                             fontSize: 12.0,
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     );
    //                                   }).toList(),
    //                                 ),
    //                                 Column(
    //                                   children: [
    //                                     Text(
    //                                       '${controller.pokemon!.height} M',
    //                                       style: const TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 25.0,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                     const Text(
    //                                       'HEIGHT',
    //                                       style: TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 12.0,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                             const SizedBox(height: 35),
    //                             Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 const Column(
    //                                   children: [
    //                                     Text(
    //                                       '248,486',
    //                                       style: TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 25.0,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       'STARDUST',
    //                                       style: TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 12.0,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 Column(
    //                                   children: [
    //                                     const Text(
    //                                       '16',
    //                                       style: TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 25.0,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       '${controller.pokemon!.name.toUpperCase()} CANDY',
    //                                       style: const TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 12.0,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.symmetric(
    //                           horizontal: 20.0, vertical: 20.0),
    //                       child: Container(
    //                         width: MediaQuery.of(context).size.width,
    //                         padding: const EdgeInsets.only(right: 20),
    //                         decoration: const BoxDecoration(
    //                           color: Colors.white,
    //                           borderRadius: BorderRadius.only(
    //                             topLeft: Radius.circular(30),
    //                             bottomLeft: Radius.circular(30),
    //                             topRight: Radius.circular(10),
    //                             bottomRight: Radius.circular(10),
    //                           ),
    //                         ),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Container(
    //                               width: 200,
    //                               padding: const EdgeInsets.symmetric(
    //                                   vertical: 14, horizontal: 10),
    //                               decoration: BoxDecoration(
    //                                 color:
    //                                     const Color.fromRGBO(156, 206, 133, 1),
    //                                 borderRadius: BorderRadius.circular(30),
    //                               ),
    //                               child: const Center(
    //                                 child: Text(
    //                                   'POWER UP',
    //                                   style: TextStyle(
    //                                     color: Colors.white,
    //                                     fontSize: 15,
    //                                     fontWeight: FontWeight.bold,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             Row(
    //                               children: [
    //                                 Image.asset(
    //                                   'assets/images/stardust.png',
    //                                   width: 27,
    //                                   height: 27,
    //                                 ),
    //                                 const SizedBox(
    //                                     width: 50, child: Text('4,500')),
    //                               ],
    //                             ),
    //                             Row(
    //                               children: [
    //                                 Container(
    //                                   width: 20,
    //                                   height: 20,
    //                                   decoration: BoxDecoration(
    //                                     shape: BoxShape.circle,
    //                                     color: m[controller.pokemon!
    //                                         .pokemonTypes[0].type.name],
    //                                   ),
    //                                 ),
    //                                 const SizedBox(width: 5),
    //                                 const Text('4'),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //                       child: Container(
    //                         width: MediaQuery.of(context).size.width,
    //                         padding: const EdgeInsets.only(right: 20),
    //                         decoration: const BoxDecoration(
    //                           color: Colors.white,
    //                           borderRadius: BorderRadius.only(
    //                             topLeft: Radius.circular(30),
    //                             bottomLeft: Radius.circular(30),
    //                             topRight: Radius.circular(10),
    //                             bottomRight: Radius.circular(10),
    //                           ),
    //                         ),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Container(
    //                               width: 200,
    //                               padding: const EdgeInsets.symmetric(
    //                                   vertical: 14, horizontal: 10),
    //                               decoration: BoxDecoration(
    //                                 color: Color.fromRGBO(156, 206, 133, 1),
    //                                 borderRadius: BorderRadius.circular(30),
    //                               ),
    //                               child: const Center(
    //                                   child: Text(
    //                                 'EVOLVE',
    //                                 style: TextStyle(
    //                                   color: Colors.white,
    //                                   fontSize: 15,
    //                                   fontWeight: FontWeight.bold,
    //                                 ),
    //                               )),
    //                             ),
    //                             const SizedBox(width: 50),
    //                             Row(
    //                               children: [
    //                                 Container(
    //                                   width: 20,
    //                                   height: 20,
    //                                   decoration: BoxDecoration(
    //                                     shape: BoxShape.circle,
    //                                     color: m[controller.pokemon!
    //                                         .pokemonTypes[0].type.name],
    //                                   ),
    //                                 ),
    //                                 const SizedBox(width: 5),
    //                                 const Text('25'),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     const Padding(padding: EdgeInsets.all(5))
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    // );
  }
}

class PokemonTitle extends StatelessWidget {
  PokemonTitle({
    super.key,
    required this.title,
    required this.id,
  });

  final String title;
  final int id;
  final PokemonDetailController controller =
      Get.find<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => GestureDetector(
            onTap: () => controller.setTitleSelectedId(id),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: controller.titleSelectedId.value == id
                        ? Colors.black
                        : Colors.grey,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                Divider(
                  color: controller.titleSelectedId.value == id
                      ? Colors.blue
                      : Colors.grey,
                )
              ],
            ),
          )),
    );
  }
}

class PokemonDetailTopic extends StatelessWidget {
  const PokemonDetailTopic({super.key, required this.topic});

  final String topic;

  @override
  Widget build(BuildContext context) {
    return Text(
      topic,
      style: TextStyle(color: Colors.grey[700]),
    );
  }
}

class PokemonAbout extends StatelessWidget {
  PokemonAbout({super.key});

  final PokemonDetailController controller =
      Get.find<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PokemonDetailTopic(topic: 'Personality'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Height'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Weight'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Abilitites'),
              ],
            ),
            const SizedBox(width: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.personality.value),
                const SizedBox(height: 15),
                Text('${controller.pokemon!.height / 10} M'),
                const SizedBox(height: 15),
                Text('${controller.pokemon!.weight / 10} KG'),
                const SizedBox(height: 15),
                Text(controller.pokemon!.abilities
                    .map((e) => e.ability.name.capitalizeFirst)
                    .toList()
                    .join(', ')),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Breeding',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Gender'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Egg Groups'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Habitat'),
              ],
            ),
            const SizedBox(width: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(
                      Icons.male,
                      color: Colors.blue,
                      size: 20,
                    ),
                    Text(
                        '${100 - (controller.pokemonSpeciesResponse!.genderRate / 8) * 100}%'),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.female,
                      color: Colors.pink,
                      size: 20,
                    ),
                    Text(
                        '${(controller.pokemonSpeciesResponse!.genderRate / 8) * 100}%'),
                  ],
                ),
                const SizedBox(height: 15),
                Text(controller.pokemonSpeciesResponse!.eggGroups
                    .map((e) => e.name)
                    .join(', ')),
                const SizedBox(height: 15),
                Text(controller.pokemonSpeciesResponse!.habitat.name),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PokemonBaseStat extends StatelessWidget {
  PokemonBaseStat({super.key});

  final PokemonDetailController controller =
      Get.find<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PokemonDetailTopic(topic: 'HP'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Attack'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Defense'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Sp. Atk'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Sp. Def'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Speed'),
                SizedBox(height: 15),
                PokemonDetailTopic(topic: 'Total'),
              ],
            ),
            const SizedBox(width: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.baseStat!.hp.toString()),
                const SizedBox(height: 15),
                Text(controller.baseStat!.attack.toString()),
                const SizedBox(height: 15),
                Text(controller.baseStat!.defense.toString()),
                const SizedBox(height: 15),
                Text(controller.baseStat!.spAtk.toString()),
                const SizedBox(height: 15),
                Text(controller.baseStat!.spDef.toString()),
                const SizedBox(height: 15),
                Text(controller.baseStat!.speed.toString()),
                const SizedBox(height: 15),
                Text(controller.baseStat!.total.toString()),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  buildStatBar(controller.baseStat!.hp / 100),
                  const SizedBox(height: 31),
                  buildStatBar(controller.baseStat!.attack / 100),
                  const SizedBox(height: 31),
                  buildStatBar(controller.baseStat!.defense / 100),
                  const SizedBox(height: 31),
                  buildStatBar(controller.baseStat!.spAtk / 100),
                  const SizedBox(height: 31),
                  buildStatBar(controller.baseStat!.spDef / 100),
                  const SizedBox(height: 31),
                  buildStatBar(controller.baseStat!.speed / 100),
                  const SizedBox(height: 31),
                  buildStatBar(controller.baseStat!.total / 600),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatBar(double val) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      tween: Tween<double>(
        begin: 0,
        end: val,
      ),
      builder: (context, value, _) => LinearProgressIndicator(
        backgroundColor: Colors.grey[100],
        color: val < 0.5 ? Colors.red : Colors.green,
        value: value,
      ),
    );
  }
}

class PokemonEvolution extends StatelessWidget {
  PokemonEvolution({super.key});

  final PokemonDetailController controller =
      Get.find<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Evolution Chain',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          child: Column(
            children: [
              if (controller.secondPokemonForm != null)
                buildEvolution(
                  controller.pokemon,
                  controller.secondPokemonForm,
                  controller.pokemonEvolutionChainResponse!
                      .getSecondEvolutionLevel()!,
                ),
              const SizedBox(height: 30),
              if (controller.thridPokemonForm != null)
                buildEvolution(
                  controller.secondPokemonForm,
                  controller.thridPokemonForm,
                  controller.pokemonEvolutionChainResponse!
                      .getThirdEvolutionLevel()!,
                ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildPokemon(String pokemonImage, String name) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Image.network(pokemonImage),
        ),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildEvolution(Pokemon? from, Pokemon? to, int level) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPokemon(
          from!.sprites.other.officialArtwork.frontDefault,
          from.name,
        ),
        Column(
          children: [
            Icon(
              Icons.arrow_right_alt_sharp,
              size: 40,
              color: Colors.grey[400],
            ),
            Text(
              'Lv. $level',
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        buildPokemon(
          to!.sprites.other.officialArtwork.frontDefault,
          to.name,
        ),
      ],
    );
  }
}

class PokemonMoves extends StatelessWidget {
  PokemonMoves({super.key});

  final PokemonDetailController controller =
      Get.find<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          controller.pokemonMoves.length,
          (index) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(controller.pokemonMoves[index].name),
                    ),
                    Image.asset(
                      PokemonConstant
                          .typeIcon[controller.pokemonMoves[index].type.name]!,
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 80,
                      child: Text(
                          'power ${controller.pokemonMoves[index].power ?? 0}'),
                    ),
                    SizedBox(
                      width: 70,
                      child: Text('pp ${controller.pokemonMoves[index].pp}'),
                    )
                  ],
                ),
                const Divider(height: 15),
                if (controller.pokemonMoves.length >= 10)
                  const Text('display only 10 moves'),
              ],
            );
          },
        ),
      ),
    );
  }
}
