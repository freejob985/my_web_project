import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_web_project/constants/app_colors.dart';
import 'package:my_web_project/constants/app_strings.dart';
import 'package:my_web_project/models/region_data.dart';

/// RegionChart widget displays a horizontal bar chart of properties by region
class RegionChart extends StatelessWidget {
  /// List of region data to display in the chart
  final List<RegionData> regions;

  /// Constructor for RegionChart
  /// 
  /// [regions] is the list of region data to display
  const RegionChart({
    super.key,
    required this.regions,
  });

  @override
  Widget build(BuildContext context) {
    // Find the maximum value for scaling
    final maxValue = regions.map((e) => e.value).reduce((a, b) => a > b ? a : b).toDouble();
    
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
              AppStrings.propertiesByRegion,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Region bars
            SizedBox(
              height: 250,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: maxValue * 1.2, // Add some space at the top
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey.shade800,
                      tooltipPadding: const EdgeInsets.all(8),
                      tooltipMargin: 8,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${regions[groupIndex].name}: ${regions[groupIndex].value}',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          // Ensure value is within range
                          if (value < 0 || value >= regions.length) {
                            return const SizedBox();
                          }
                          
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              regions[value.toInt()].name,
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  barGroups: List.generate(
                    regions.length,
                    (index) => BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: regions[index].value.toDouble(),
                          color: AppColors.primary,
                          width: 20,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 