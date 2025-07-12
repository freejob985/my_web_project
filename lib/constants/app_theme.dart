import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_project/constants/app_colors.dart';

/// AppTheme class contains theme data for the application
/// This provides a consistent look and feel throughout the app
class AppTheme {
  /// Light theme for the application
  static ThemeData lightTheme = ThemeData(
    // Use Material 3 design
    useMaterial3: true,
    
    // Set primary color from our color constants
    primaryColor: AppColors.primary,
    
    // Set color scheme based on our primary color
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      background: AppColors.background,
    ),
    
    // Use Google Fonts for Cairo font
    textTheme: GoogleFonts.cairoTextTheme(
      const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
      ),
    ),
    
    // Card theme for consistent card styling
    cardTheme: CardTheme(
      color: AppColors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    
    // AppBar theme for top bar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleTextStyle: GoogleFonts.cairo(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    
    // Scaffold background color
    scaffoldBackgroundColor: AppColors.background,
  );
} 