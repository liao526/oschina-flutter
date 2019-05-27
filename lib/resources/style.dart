import 'package:flutter/material.dart';
import 'colors.dart'show ThemeColors;

ThemeData getDefThemeData() {
  return ThemeData(
    primarySwatch: ThemeColors.MAIN_COLOR,
    buttonColor: ThemeColors.MAIN_COLOR,
    textSelectionColor: Colors.black,
  );
}