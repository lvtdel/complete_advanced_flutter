import 'package:complete_advanced_flutter/presentation/resource/color_manager.dart';
import 'package:complete_advanced_flutter/presentation/resource/font_manager.dart';
import 'package:complete_advanced_flutter/presentation/resource/style_manager.dart';
import 'package:complete_advanced_flutter/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,

    splashColor: ColorManager.primaryOpacity70,

    disabledColor: ColorManager.grey1,
    // accentColor replace by
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),

    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true, color: ColorManager.primary, elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(color: ColorManager.white, fonSize: FontSize.s16)
    ),

    buttonTheme: ButtonThemeData(shape: StadiumBorder(),
    disabledColor: ColorManager.grey1, buttonColor: ColorManager.primary, splashColor: ColorManager.primaryOpacity70),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))
      ),
    ),

  //     update
  //     headline1 is now displayLarge
  //     headline2 is now displayMedium
  //     headline3 is now displaySmall
  //     headline4 is now headlineLarge
  //     headline5 is now headlineMedium
  //     headline6 is now headlineSmall
  //     Body Styles:
  //     bodyText1 is now bodyLarge
  //     bodyText2 is now bodyMedium
  //     caption is now bodySmall
  //     Label Styles:
  //     button is now labelLarge
  //     overline is now labelSmall
  //     Additional Styles:
  //     subtitle1 is now titleMedium
  //     subtitle2 is now titleSmall
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fonSize: FontSize.s16),
      titleMedium: getMediumStyle(color: ColorManager.lightGrey, fonSize: FontSize.s14),
      titleSmall: getMediumStyle(color: ColorManager.primary, fonSize: FontSize.s14),
      bodySmall: getRegularStyle(color: ColorManager.grey1),
      bodyLarge: getRegularStyle(color: ColorManager.grey)
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: getRegularStyle(color: ColorManager.error),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    )
  );
}