import 'package:flutter/material.dart';

/// PropertyTypeData class represents data for a property type in the pie chart
/// It contains the label, percentage, and color for the property type
class PropertyTypeData {
  /// The label of the property type (e.g., "شقق")
  final String label;
  
  /// The percentage of this property type (e.g., 45)
  final double percent;
  
  /// The color to use for this property type in the chart
  final Color color;

  /// Constructor for creating a PropertyTypeData object
  /// 
  /// [label] is the property type label
  /// [percent] is the percentage of this property type
  /// [color] is the color to use for this property type in the chart
  PropertyTypeData({
    required this.label,
    required this.percent,
    required this.color,
  });
} 