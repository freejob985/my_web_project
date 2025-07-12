import 'package:flutter/material.dart';

/// StatItem class represents a statistic displayed in a card on the dashboard
/// It contains the label, value, icon, and color
class StatItem {
  /// The display text for the statistic
  final String label;
  
  /// The numeric value of the statistic
  final int value;
  
  /// The icon to display in the statistic card
  final IconData icon;
  
  /// The color for the icon and accent elements
  final Color color;

  /// Constructor for creating a StatItem
  /// 
  /// [label] is the display text
  /// [value] is the numeric value
  /// [icon] is the icon to display
  /// [color] is the accent color for the card
  StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });
} 