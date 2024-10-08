import 'package:flutter/material.dart';

class Style {
  //

  static TextStyle spaceGrotesk(
      {double fontSize = 14,
      Color? color,
      FontWeight? fontWeight,
      String? fontFamily = 'SpaceGrotesk',
      FontStyle fontStyle = FontStyle.normal}) {
    return TextStyle(
      color: color,
      overflow: TextOverflow.ellipsis,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      fontStyle: fontStyle,
      decoration: TextDecoration.none,
    );
  }
}
