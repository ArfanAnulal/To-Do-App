import 'package:flutter/material.dart';

class AppTheme{
  static const Color appBackgroundColor = Color(0xFF1A1A2E);
  static const Color secondaryColor = Color(0xFF7DF9FF);
  static const Color cardBackgroundColor = Color(0xFF16213E);
  static const Color primaryAccent = Color(0xFFF07DEA);
  static  ShapeBorder cardShape = RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            );


  static final ThemeData darkMode = ThemeData(
    primaryColor:appBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: appBackgroundColor,
      foregroundColor: secondaryColor ,
    ),
    scaffoldBackgroundColor: appBackgroundColor,
    cardColor: cardBackgroundColor,
    cardTheme: CardThemeData(
      color: cardBackgroundColor,
      shape: cardShape
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryAccent
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(appBackgroundColor),
    )
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