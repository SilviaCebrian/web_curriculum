import 'package:flutter/material.dart';

final myTheme = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: const Color(0xFF9E62B9),
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF161616),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      //  selectionColor: Colors.green,
      selectionHandleColor: Colors.deepPurple[300],
    ));
