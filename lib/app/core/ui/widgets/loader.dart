import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:star_wars_w2o/app/core/ui/styles/colors_app.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.white,
              width: 0.5,
            )),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: LoadingAnimationWidget.threeArchedCircle(
            color: context.colors.primary,
            size: 60,
          ),
        ),
      ),
    );
  }
}
