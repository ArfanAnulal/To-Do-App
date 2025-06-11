import 'package:flutter/material.dart';

class AppTheme{
  static const Color appBackgroundColor = Color(0xFF1A1A2E);
  static const Color secondaryColor = Color(0xFF7DF9FF);
  static const Color cardBackgroundColor = Color(0xFF16213E);
  static const Color primaryAccent = Color(0xFFF07DEA);


  static final ThemeData darkMode = ThemeData(
    primaryColor:appBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: appBackgroundColor,
      foregroundColor: secondaryColor ,
    ),
    scaffoldBackgroundColor: appBackgroundColor,
    cardColor: cardBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryAccent
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty(),
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

  static const TextStyle fieldText = TextStyle(
    color: textFieldFontColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    
  );

  static const TextStyle formHeading =TextStyle(
    color: textFieldFontColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bioName = TextStyle(
    color: textFieldFontColor,
    fontSize: 40,
    fontWeight: FontWeight.bold
  );

  static const TextStyle bioDesignation = TextStyle(
    color: textFieldFontColor,
    fontSize: 20,
    fontWeight: FontWeight.w500
  ); 

  static const TextStyle bioBio = TextStyle(
    color: textFieldFontColor,
    fontSize: 15,
    fontWeight: FontWeight.normal
  );  
  
}