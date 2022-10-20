import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * .8, child: Image.asset('assets/images/logo.png')),
              const SizedBox(height: 50),
              LoadingAnimationWidget.fourRotatingDots(color: Colors.amber, size: 70),
            ],
          ),
        ),
      ),
    );
  }
}
