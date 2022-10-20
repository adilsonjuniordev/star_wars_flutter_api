import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_w2o/app/core/ui/styles/colors_app.dart';
import 'package:star_wars_w2o/app/core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/info_box.dart';
import './film_details_controller.dart';

class FilmDetailsPage extends GetView<FilmDetailsController> {
  const FilmDetailsPage({Key? key}) : super(key: key);

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
              controller.characterName.value,
              style: context.textStyles.textSecondaryFontRegular.copyWith(color: Colors.black, fontSize: 14),
            ),
            actions: [
              IconButton(
                onPressed: () => Get.until((route) => route.settings.name == '/home'),
                icon: const Icon(Icons.home),
              )
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
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    textAlign: TextAlign.center,
                    'Detalhes do filme:',
                    style: context.textStyles.textPrimaryFontRegular.copyWith(
                      color: context.colors.primary,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  InfoBox(controller: controller, title: 'Título do filme', body: controller.title.value),
                  const SizedBox(height: 30),
                  InfoBox(controller: controller, title: 'Diretor', body: controller.director.value),
                  const SizedBox(height: 30),
                  InfoBox(controller: controller, title: 'Data de lançamento', body: controller.releaseDate.value),
                  const SizedBox(height: 30),
                  InfoBox(controller: controller, title: 'Produtores', body: controller.producer.value),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
