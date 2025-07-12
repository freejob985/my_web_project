import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_web_project/constants/app_strings.dart';
import 'package:my_web_project/models/property_type_data.dart';

/// PropertyTypeChart widget displays a pie chart of property types
class PropertyTypeChart extends StatelessWidget {
  /// List of property type data to display in the chart
  final List<PropertyTypeData> propertyTypes;

  /// Constructor for PropertyTypeChart
  /// 
  /// [propertyTypes] is the list of property type data to display
  const PropertyTypeChart({
    super.key,
    required this.propertyTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chart title
            Text(
              AppStrings.propertyTypes,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Pie chart and legend
            LayoutBuilder(
              builder: (context, constraints) {
                // For responsive layout
                final width = constraints.maxWidth;
                final isMobile = width < 600;
                
                if (isMobile) {
                  // Stack chart and legend vertically on mobile
                  return Column(
                    children: [
                      // Pie chart
                      SizedBox(
                        height: 200,
                        child: PieChart(
                          PieChartData(
                            sections: _generatePieSections(),
                            centerSpaceRadius: 40,
                            sectionsSpace: 2,
                            pieTouchData: PieTouchData(
                              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                // Handle touch events if needed
                              },
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Legend
                      Wrap(
                        spacing: 16,
                        runSpacing: 8,
                        children: propertyTypes.map((type) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: type.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${type.label} (${type.percent.toInt()}%)',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  );
                } else {
                  // Display chart and legend side by side on larger screens
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Pie chart
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 200,
                          child: PieChart(
                            PieChartData(
                              sections: _generatePieSections(),
                              centerSpaceRadius: 40,
                              sectionsSpace: 2,
                              pieTouchData: PieTouchData(
                                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                  // Handle touch events if needed
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      // Legend
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: propertyTypes.map((type) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: type.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '${type.label} (${type.percent.toInt()}%)',
                                      style: const TextStyle(fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Generates pie chart sections from property type data
  /// 
  /// Returns a list of PieChartSectionData objects
  List<PieChartSectionData> _generatePieSections() {
    return propertyTypes.map((type) {
      return PieChartSectionData(
        color: type.color,
        value: type.percent,
        title: '${type.percent.toInt()}%',
        radius: 80,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
} 