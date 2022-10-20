import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_w2o/app/core/ui/styles/colors_app.dart';
import 'package:star_wars_w2o/app/core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/info_box.dart';
import '../../core/ui/widgets/loader.dart';
import './character_details_controller.dart';

class CharacterDetailsPage extends GetView<CharacterDetailsController> {
  const CharacterDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              const SizedBox(height: 20),
                              InfoBox(controller: controller, title: 'Gênero', body: controller.gender.value),
                              const SizedBox(height: 20),
                              InfoBox(controller: controller, title: 'Ano de Aniversário', body: controller.birthYear.value),
                              const SizedBox(height: 20),
                              InfoBox(controller: controller, title: 'Nome do planeta', body: controller.homeworld.value),
                              const SizedBox(height: 20),
                              InfoBox(controller: controller, title: 'Terreno do planeta', body: controller.terrain.value),
                              const SizedBox(height: 20),
                              InfoBox(controller: controller, title: 'Diâmetro do planeta', body: controller.diameter.value),
                              const SizedBox(height: 20),
                              InfoBox(controller: controller, title: 'Nome da nave', body: controller.starship.value),
                              const SizedBox(height: 20),
                              Divider(color: context.colors.greyDark, thickness: 0.5, indent: 20, endIndent: 20),
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
                                        const DataCell(Center(child: Text('Nome Completo:'))),
                                        DataCell(Center(child: Text(controller.name.value, style: const TextStyle(color: Colors.white)))),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Center(child: Text('Gênero:'))),
                                        DataCell(Center(child: Text(controller.gender.value, style: const TextStyle(color: Colors.white)))),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Center(child: Text('Ano de aniversário:'))),
                                        DataCell(Center(child: Text(controller.birthYear.value, style: const TextStyle(color: Colors.white)))),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Center(child: Text('Nome do planeta:'))),
                                        DataCell(Center(child: Text(controller.homeworld.value, style: const TextStyle(color: Colors.white)))),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Center(child: Text('Terreno do planeta:'))),
                                        DataCell(Center(child: Text(controller.terrain.value, style: const TextStyle(color: Colors.white)))),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Center(child: Text('Diâmetro do planeta:'))),
                                        DataCell(Center(child: Text(controller.diameter.value, style: const TextStyle(color: Colors.white)))),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Center(child: Text('Nome da nave:'))),
                                        DataCell(Center(child: Text(controller.starship.value, style: const TextStyle(color: Colors.white)))),
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
              const SizedBox(height: 10),
              Text('Filmes',
                  style: context.textStyles.textPrimaryFontRegular.copyWith(
                    color: context.colors.grey,
                    fontSize: 22,
                  )),
            ],
          );
        },
        onLoading: const Center(child: Loader()),
      ),
    );
  }
}
