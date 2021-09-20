import 'package:butter/utils/constants.dart';
import 'package:flutter/material.dart';

class ButterButtonStyle {
  static ButtonStyle mainThemeButtonStyle() {
    return ElevatedButton.styleFrom(
      elevation: 0,
      onPrimary: Colors.white,
      textStyle: TextStyle(
        fontFamily: MAIN_FONT_FAMILY,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
    );
  }
}