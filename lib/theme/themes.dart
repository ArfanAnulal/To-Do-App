import 'package:flutter/material.dart';

class AppTheme {

  // bottom sheet title color
  static const Color darkModeTextColor = Color(0xFF757575);
  static const Color lightModeTextColor = Color(0xFF000000);

  // dark mode
  static const Color darkAppBackgroundColor = Color(0xFF1A1A2E);
  static const Color darkSecondaryColor = Color(0xFF7DF9FF); // For AppBar title
  static const Color darkCardBackgroundColor = Color(0xFF16213E);
  static const Color darkBottomAppBarColor = Color(0xFF0D0D23);
  static const Color darkTextColor = Color(0xFFEFEFEF);
  static const Color darkTextCompletedColor = Color(0xFF888888);
  static const Color darkIconColor = Color(0xFFE94560); // Delete icon

  // light mode
  static const Color lightAppBackgroundColor = Color(0xFFF5F5F5);
  static const Color lightSecondaryColor = Color(0xFF1A1A2E); // For AppBar title
  static const Color lightCardBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightBottomAppBarColor = Color(0xFFE0E0E0);
  static const Color lightTextColor = Color(0xFF1A1A2E);
  static const Color lightTextCompletedColor = Color(0xFF757575);
  static const Color lightIconColor = Color(0xFFE53935); // Delete icon

  // shared
  static const Color primaryAccent = Color(0xFFF07DEA); // For FAB, Switch, Checkbox
  static ShapeBorder cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  );

  // Dark Theme
  static final ThemeData darkMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'EduNSWACTHandPre',
    scaffoldBackgroundColor: darkAppBackgroundColor,
    primaryColor: darkAppBackgroundColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: darkAppBackgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: darkSecondaryColor,fontFamily: 'EduNSWACTHandPre' ),
    ),

    cardTheme: CardThemeData(
      color: darkCardBackgroundColor,
      shape: cardShape,
      elevation: 4,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryAccent,
      foregroundColor: Colors.white,
    ),

    bottomAppBarTheme: const BottomAppBarTheme(
      color: darkBottomAppBarColor,
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(primaryAccent),
      checkColor: WidgetStateProperty.all(darkAppBackgroundColor),
    ),

    iconTheme: const IconThemeData(
      color: darkIconColor, // Default for icons 
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: darkIconColor, // For leading/trailing icons
    ),

    textTheme: const TextTheme(
      // Style for the task
      bodyLarge: TextStyle(color: darkTextColor, fontSize: 16),
      // Style for the completed task
      bodyMedium: TextStyle(
        color: darkTextCompletedColor,
        fontSize: 16,
        decoration: TextDecoration.lineThrough,
      ),
    ),
  );


  // Light Mode
  static final ThemeData lightMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'EduNSWACTHandPre',
    scaffoldBackgroundColor: lightAppBackgroundColor,
    primaryColor: lightAppBackgroundColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: lightAppBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: lightSecondaryColor), // For back arrows, etc.
      titleTextStyle: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: lightSecondaryColor,fontFamily: 'EduNSWACTHandPre'),
    ),

    cardTheme: CardThemeData(
      color: lightCardBackgroundColor,
      shape: cardShape,
      elevation: 4,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryAccent,
      foregroundColor: Colors.white,
    ),

     bottomAppBarTheme: const BottomAppBarTheme(
      color: lightBottomAppBarColor,
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(primaryAccent),
      checkColor: WidgetStateProperty.all(lightCardBackgroundColor),
    ),

    iconTheme: const IconThemeData(
      color: lightIconColor,
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: lightIconColor, // For leading/trailing icons
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: lightTextColor, fontSize: 16),
      bodyMedium: TextStyle(
        color: lightTextCompletedColor,
        fontSize: 16,
        decoration: TextDecoration.lineThrough,
      ),
    ),
  );
}
