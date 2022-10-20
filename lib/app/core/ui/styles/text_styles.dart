import 'package:flutter/material.dart';

import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Starjedi';
  String get secondaryFont => 'Starjout';
  String get tertiaryFont => 'DeathStar';

  TextStyle get textPrimaryFontRegular => TextStyle(fontWeight: FontWeight.normal, fontFamily: primaryFont, color: Colors.white);
  TextStyle get textPrimaryFontMedium => TextStyle(fontWeight: FontWeight.w500, fontFamily: primaryFont, color: Colors.white);
  TextStyle get textPrimaryFontBold => TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont, color: Colors.white);

  TextStyle get textSecondaryFontRegular => TextStyle(fontFamily: secondaryFont, fontWeight: FontWeight.normal, color: Colors.white);
  TextStyle get textSecondaryFontMedium => TextStyle(fontWeight: FontWeight.w600, fontFamily: secondaryFont, color: Colors.white);
  TextStyle get textSecondaryFontBold => TextStyle(fontWeight: FontWeight.bold, fontFamily: secondaryFont, color: Colors.white);

  TextStyle get textTertiaryFontRegular => TextStyle(fontWeight: FontWeight.normal, fontFamily: tertiaryFont, color: Colors.white);
  TextStyle get textTertiaryFontMedium => TextStyle(fontWeight: FontWeight.w500, fontFamily: tertiaryFont, color: Colors.white);
  TextStyle get textTertiaryFontBold => TextStyle(fontWeight: FontWeight.bold, fontFamily: tertiaryFont, color: Colors.white);

  TextStyle get labelTextField => textPrimaryFontRegular.copyWith(color: ColorsApp.i.greyDark, fontSize: 12);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
