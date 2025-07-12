import 'package:flutter/material.dart';

/// MenuItem class represents an item in the sidebar menu
/// It contains the label, icon, and optional submenu items
class MenuItem {
  /// The display text for the menu item
  final String label;
  
  /// The icon to display next to the label
  final IconData icon;
  
  /// Optional list of submenu items
  final List<MenuItem>? subItems;
  
  /// Whether the menu item is currently expanded to show submenu items
  bool isExpanded;

  /// Constructor for creating a MenuItem
  /// 
  /// [label] is the display text
  /// [icon] is the icon to display
  /// [subItems] is an optional list of submenu items
  /// [isExpanded] determines if submenu is initially expanded
  MenuItem({
    required this.label,
    required this.icon,
    this.subItems,
    this.isExpanded = false,
  });
} 