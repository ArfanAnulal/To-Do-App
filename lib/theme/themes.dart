import 'package:flutter/material.dart';

class AppTheme{
  static const Color darkappBackgroundColor = Color(0xFF1A1A2E);
  static const Color darksecondaryColor = Color(0xFF7DF9FF);
  static const Color darkcardBackgroundColor = Color(0xFF16213E);
  static const Color primaryAccent = Color(0xFFF07DEA);
  static  ShapeBorder cardShape = RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            );


  static final ThemeData darkMode = ThemeData(
    primaryColor:darkappBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkappBackgroundColor,
      foregroundColor: darksecondaryColor ,
    ),
    scaffoldBackgroundColor: darkappBackgroundColor,
    cardColor: darkcardBackgroundColor,
    cardTheme: CardThemeData(
      color: darkcardBackgroundColor,
      shape: cardShape
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryAccent
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(darkappBackgroundColor),
    ),
  );

  static const Color lightAppBackgroundColor = Color(0xFFF5F5F5); // light grey
  static const Color lightSecondaryColor = Color(0xFF1A1A2E); // deep navy (same as dark bg, now as text)
  static const Color lightCardBackgroundColor = Color(0xFFFFFFFF); // pure white

  static final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: lightAppBackgroundColor,
  scaffoldBackgroundColor: lightAppBackgroundColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: lightAppBackgroundColor,
    foregroundColor: lightSecondaryColor,
  ),

  cardColor: lightCardBackgroundColor,

  cardTheme: CardThemeData(
    color: lightCardBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryAccent,
  ),

  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(lightAppBackgroundColor),
  ),
);
  
}

class AppTextTheme{
  static const Color textColor = Color(0xFFEFEFEF); 
  static const Color textCompletedColor = Color(0xFF888888); 

  static const TextStyle appBarText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30
  );
  
}