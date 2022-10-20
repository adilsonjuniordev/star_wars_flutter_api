import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/info_box.dart';
import '../../core/ui/widgets/loader.dart';
import './character_details_controller.dart';

class CharacterDetailsPage extends GetView<CharacterDetailsController> {
  const CharacterDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background_space.jpg',
          color: Colors.white.withOpacity(0.6),
          colorBlendMode: BlendMode.modulate,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Detalhes do personagem',
              style: context.textStyles.textSecondaryFontRegular.copyWith(color: Colors.black, fontSize: 14),
            ),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(child: const Text('Modo padrão'), onTap: () => controller.viewType.value = true),
                        PopupMenuItem(child: const Text('Modo tabela'), onTap: () => controller.viewType.value = false),
                      ])
            ],
            leading: IconButton(
              onPressed: () => Get.back(),
              padding: const EdgeInsets.only(left: 10),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
          ),
          body: controller.obx(
            (state) {
              return Column(
                children: [
                  Obx(
                    () => controller.viewType.value
                        ? SingleChildScrollView(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 20),
                                  InfoBox(controller: controller, title: 'Nome Completo', body: controller.name.value),
                                  const SizedBox(height: 13),
                                  InfoBox(controller: controller, title: 'Gênero', body: controller.gender.value),
                                  const SizedBox(height: 13),
                                  InfoBox(controller: controller, title: 'Ano de Aniversário', body: controller.birthYear.value),
                                  const SizedBox(height: 13),
                                  InfoBox(controller: controller, title: 'Nome do planeta', body: controller.homeworld.value),
                                  const SizedBox(height: 13),
                                  InfoBox(controller: controller, title: 'Terreno do planeta', body: controller.terrain.value),
                                  const SizedBox(height: 13),
                                  InfoBox(controller: controller, title: 'Diâmetro do planeta', body: controller.diameter.value),
                                  const SizedBox(height: 13),
                                  InfoBox(controller: controller, title: 'Nome da nave', body: controller.starship.value),
                                  const SizedBox(height: 13),
                                ],
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    controller.name.value,
                                    style: context.textStyles.textPrimaryFontRegular.copyWith(color: context.colors.grey, fontSize: 22),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Colors.white),
                                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                                    ),
                                    child: SingleChildScrollView(
                                      child: DataTable(
                                        columnSpacing: 5,
                                        border: TableBorder.symmetric(inside: BorderSide.none, outside: BorderSide.none),
                                        headingRowHeight: 0,
                                        columns: const [
                                          DataColumn(label: Text('')),
                                          DataColumn(label: Text('')),
                                        ],
                                        rows: [
                                          DataRow(cells: [
                                            const DataCell(Center(child: Text('Nome Completo:', textAlign: TextAlign.center))),
                                            DataCell(Center(child: Text(controller.name.value, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)))),
                                          ]),
                                          DataRow(cells: [
                                            const DataCell(Center(child: Text('Gênero:', textAlign: TextAlign.center))),
                                            DataCell(Center(child: Text(controller.gender.value, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)))),
                                          ]),
                                          DataRow(cells: [
                                            const DataCell(Center(child: Text('Ano de aniversário:', textAlign: TextAlign.center))),
                                            DataCell(Center(child: Text(controller.birthYear.value, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)))),
                                          ]),
                                          DataRow(cells: [
                                            const DataCell(Center(child: Text('Nome do planeta:', textAlign: TextAlign.center))),
                                            DataCell(Center(child: Text(controller.homeworld.value, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)))),
                                          ]),
                                          DataRow(cells: [
                                            const DataCell(Center(child: Text('Terreno do planeta:', textAlign: TextAlign.center))),
                                            DataCell(Center(child: Text(controller.terrain.value, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)))),
                                          ]),
                                          DataRow(cells: [
                                            const DataCell(Center(child: Text('Diâmetro do planeta:', textAlign: TextAlign.center))),
                                            DataCell(Center(child: Text(controller.diameter.value, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)))),
                                          ]),
                                          DataRow(cells: [
                                            const DataCell(Center(child: Text('Nome da nave:', textAlign: TextAlign.center))),
                                            DataCell(Center(child: Text(controller.starship.value, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)))),
                                          ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                  Text(
                    'Filmes',
                    style: context.textStyles.textPrimaryFontRegular.copyWith(
                      color: context.colors.grey,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Expanded(
                      child: ListView.builder(
                        itemCount: controller.films.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Center(
                              child: Text(
                                controller.films[index].title,
                                style: context.textStyles.textSecondaryFontRegular.copyWith(
                                  color: context.colors.primary,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            onTap: () => Get.toNamed(
                              '/film_details',
                              arguments: [
                                controller.films[index],
                                controller.name.value,
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
            onLoading: const Center(child: Loader()),
          ),
        ),
      ],
    );
  }
}
