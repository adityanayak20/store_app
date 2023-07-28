import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.grey[100], // Light gray background
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey[900], // Dark blue app bar for light mode
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.deepOrange, // Same as primarySwatch
      secondary: Colors.deepOrange, // New accent color for light mode
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87, // Darker text color
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        color: Colors.black87, // Darker text color
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        color: Colors.grey[600], // Slightly lighter text color for captions
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrange, // Deep purple buttons
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      color: Colors.grey[300], // Light gray divider color
    ),
    // Tab-related theme data
    tabBarTheme: TabBarTheme(
      labelColor: Colors.deepOrange, // Selected tab label color
      unselectedLabelColor: Colors.grey[600], // Unselected tab label color
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.deepOrange, // Tab indicator color
            width: 2.0,
          ),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.grey[900], // Dark gray background
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey[900], // Dark app bar for dark mode
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.deepOrange, // Same as primarySwatch
      secondary: Colors.deepOrange, // New accent color for dark mode
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white, // White text color
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        color: Colors.white, // White text color
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        color: Colors.grey[400], // Light gray text color for captions
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrange, // Deep purple buttons
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      color: Colors.grey[800], // Dark gray divider color
    ),
    // Tab-related theme data
    tabBarTheme: TabBarTheme(
      labelColor: Colors.deepOrange, // Selected tab label color
      unselectedLabelColor: Colors.grey[400], // Unselected tab label color
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.deepOrange, // Tab indicator color
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}
