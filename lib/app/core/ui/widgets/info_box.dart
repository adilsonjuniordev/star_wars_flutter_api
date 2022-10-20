import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:star_wars_w2o/app/core/ui/styles/colors_app.dart';
import 'package:star_wars_w2o/app/core/ui/styles/text_styles.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
    required this.controller,
    required this.title,
    required this.body,
  });

  final GetxController controller;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    const double borderWidthTop = 0.3;
    const double borderWidthBottom = 1.5;
    const double borderRadius = 15;
    final Color borderColor = context.colors.greyDark;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(borderRadius)),
            border: Border.all(color: borderColor, width: borderWidthTop),
            color: context.colors.primary,
          ),
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: context.textStyles.textSecondaryFontRegular.copyWith(color: Colors.black, fontSize: 16),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(borderRadius)),
            border: Border.all(color: borderColor, width: borderWidthBottom),
          ),
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: context.textStyles.textPrimaryFontRegular.copyWith(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }
}
