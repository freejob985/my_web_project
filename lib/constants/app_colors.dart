import 'package:flutter/material.dart';

/// AppColors class contains all color constants used throughout the application
/// This centralized approach makes it easier to maintain and update the color scheme
class AppColors {
  /// Primary color used for main elements like the sidebar
  static const Color primary = Color(0xFF0033CC);
  
  /// Background color for the main content area
  static const Color background = Color(0xFFF9F9F9);
  
  /// White color used for cards and top bar
  static const Color white = Colors.white;
  
  /// Black color used for text
  static const Color black = Colors.black;
  
  /// Grey color used for secondary text
  static const Color grey = Color(0xFF757575);
  
  /// Light grey color used for borders and dividers
  static const Color lightGrey = Color(0xFFEEEEEE);
  
  /// Colors for statistics cards
  static const Color ordersCard = Color(0xFFE573C0);
  static const Color propertiesCard = Color(0xFF81C784);
  static const Color officesCard = Color(0xFFFFD54F);
  static const Color usersCard = Color(0xFF90A4AE);
  
  /// Colors for property types chart
  static const Color apartments = Color(0xFF2196F3);
  static const Color villas = Color(0xFF4CAF50);
  static const Color lands = Color(0xFFFFEB3B);
  static const Color commercialComplexes = Color(0xFF9C27B0);
  static const Color offices = Color(0xFFF44336);
} 