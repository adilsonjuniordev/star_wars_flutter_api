import 'package:flutter/material.dart';
import 'package:star_wars_w2o/app/core/ui/styles/colors_app.dart';
import 'package:star_wars_w2o/app/core/ui/styles/text_styles.dart';

import '../../../screens/character_details/character_details_controller.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
    required this.controller,
    required this.title,
    required this.body,
  });

  final CharacterDetailsController controller;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    const double borderWidth = 0.5;
    const double borderRadius = 22;
    final Color borderColor = context.colors.grey;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(borderRadius)),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: Text(
            title,
            style: context.textStyles.textSecondaryFontRegular.copyWith(color: context.colors.primary, fontSize: 16),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(borderRadius)),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: Text(
            body,
            style: context.textStyles.textPrimaryFontRegular.copyWith(color: Colors.white, fontSize: 13),
          ),
        )
      ],
    );
  }
}
