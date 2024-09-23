import 'package:flutter/material.dart';

final myTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: const Color(0xFF9E62B9),
    brightness: Brightness.dark,
    snackBarTheme: const SnackBarThemeData(backgroundColor: Color(0xFF161616)),
    //  colorScheme: const ColorScheme.light(background: Color(0xFF161616)),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      //  selectionColor: Colors.green,
      selectionHandleColor: Colors.deepPurple[300],
    ));
