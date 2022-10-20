import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../models/character_model.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final searchEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background_space.jpg',
          color: Colors.white.withOpacity(0.7),
          colorBlendMode: BlendMode.modulate,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        GestureDetector(
          onTap: FocusManager.instance.primaryFocus?.unfocus,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Image.asset('assets/images/logo.png', scale: 2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextField(
                      controller: searchEC,
                      onChanged: (val) {
                        controller.query.value = val;
                      },
                      style: context.textStyles.labelTextField,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            searchEC.clear();
                            controller.query.value = '';
                          },
                          icon: Icon(Icons.clear, color: context.colors.greyDark, size: 20),
                        ),
                        hintText: 'Pesquisar personagem',
                        hintStyle: context.textStyles.labelTextField,
                        labelStyle: context.textStyles.labelTextField,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Obx(() {
                      return controller.query.isEmpty
                          ? customScrollView(onEndPage: controller.nextPage, chars: controller.characters)
                          : customScrollView(onEndPage: controller.nextPageFiltered, chars: controller.charactersFiltered);
                    }),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  LazyLoadScrollView customScrollView({required Function onEndPage, required List<CharacterModel> chars}) {
    return LazyLoadScrollView(
      onEndOfPage: () => onEndPage(),
      child: Scrollbar(
        thumbVisibility: true,
        thickness: 8,
        radius: const Radius.circular(10),
        interactive: true,
        child: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: chars.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => Get.toNamed('/character_details', arguments: chars[index]),
              minVerticalPadding: 16,
              horizontalTitleGap: 6,
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: context.colors.primary,
              ),
              title: Row(
                children: [
                  Text('${index + 1}', style: context.textStyles.textPrimaryFontRegular.copyWith(color: context.colors.primary)),
                  const SizedBox(width: 10),
                  Text(chars[index].name, style: context.textStyles.textTertiaryFontRegular),
                ],
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            );
          },
        ),
      ),
    );
  }
}
