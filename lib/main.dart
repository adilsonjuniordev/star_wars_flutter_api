import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'app/core/config/env/env.dart';
import 'app/screens/home/home_page.dart';
import 'app/screens/home/home_bindings.dart';
import 'app/screens/splash/splash_page.dart';
import 'app/core/ui/theme/theme_config.dart';
import 'app/screens/splash/splash_bindings.dart';
import 'app/application/application_bindings.dart';
import 'app/screens/film_details/film_details_page.dart';
import 'app/screens/film_details/film_details_bindings.dart';
import 'app/screens/character_details/character_details_page.dart';
import 'app/screens/character_details/character_details_bindings.dart';

void main() async {
  await Env.i.load();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      getPages: [
        GetPage(name: '/', page: () => const SplashPage(), binding: SplashBindings(), children: [
          GetPage(name: '/home', page: () => HomePage(), binding: HomeBindings()),
          GetPage(name: '/film_details', page: () => const FilmDetailsPage(), binding: FilmDetailsBindings()),
          GetPage(name: '/character_details', page: () => const CharacterDetailsPage(), binding: CharacterDetailsBindings()),
        ]),
      ],
    );
  }
}
