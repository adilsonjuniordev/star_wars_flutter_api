import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
          style: context.textStyles.textSecondaryFontRegular.copyWith(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            padding: const EdgeInsets.only(left: 10),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: controller.obx(
        (state) {
          return SingleChildScrollView(
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
                ],
              ),
            ),
          );
        },
        onLoading: const Center(child: Loader()),
      ),
    );
  }
}
