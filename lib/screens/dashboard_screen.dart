import 'package:flutter/material.dart';
import 'package:my_web_project/constants/app_strings.dart';
import 'package:my_web_project/providers/dashboard_provider.dart';
import 'package:my_web_project/widgets/property_type_chart.dart';
import 'package:my_web_project/widgets/region_chart.dart';
import 'package:my_web_project/widgets/stat_card.dart';
import 'package:provider/provider.dart';

/// DashboardScreen displays the main dashboard content with statistics and charts
class DashboardScreen extends StatelessWidget {
  /// Constructor for DashboardScreen
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the dashboard provider
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Statistics cards row
          _buildStatsRow(dashboardProvider),
          
          const SizedBox(height: 24),
          
          // Charts section
          _buildChartsSection(dashboardProvider),
        ],
      ),
    );
  }

  /// Builds the statistics cards row
  /// 
  /// [dashboardProvider] is the provider for dashboard data
  /// Returns a Widget containing the statistics cards
  Widget _buildStatsRow(DashboardProvider dashboardProvider) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // For responsive layout
        final width = constraints.maxWidth;
        final isMobile = width < 800;
        
        if (isMobile) {
          // Stack cards vertically on mobile
          return Column(
            children: dashboardProvider.stats.map((stat) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: StatCard(stat: stat),
              );
            }).toList(),
          );
        } else {
          // Display cards in a row on larger screens
          return Row(
            children: dashboardProvider.stats.map((stat) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: StatCard(stat: stat),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }

  /// Builds the charts section
  /// 
  /// [dashboardProvider] is the provider for dashboard data
  /// Returns a Widget containing the region and property type charts
  Widget _buildChartsSection(DashboardProvider dashboardProvider) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // For responsive layout
        final width = constraints.maxWidth;
        final isMobile = width < 800;
        
        if (isMobile) {
          // Stack charts vertically on mobile
          return Column(
            children: [
              RegionChart(regions: dashboardProvider.regions),
              const SizedBox(height: 24),
              PropertyTypeChart(propertyTypes: dashboardProvider.propertyTypes),
            ],
          );
        } else {
          // Display charts side by side on larger screens
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: RegionChart(regions: dashboardProvider.regions),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 2,
                child: PropertyTypeChart(propertyTypes: dashboardProvider.propertyTypes),
              ),
            ],
          );
        }
      },
    );
  }
} 