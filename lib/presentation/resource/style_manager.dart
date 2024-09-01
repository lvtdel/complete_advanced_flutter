import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getRegularStyle(
    {double fonSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fonSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

TextStyle getLightStyle({double fonSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fonSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

TextStyle getBoldStyle({double fonSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fonSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

TextStyle getSemiBoldStyle(
    {double fonSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fonSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

TextStyle getMediumStyle(
    {double fonSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fonSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}
