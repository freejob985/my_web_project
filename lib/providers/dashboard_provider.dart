import 'package:flutter/material.dart';
import 'package:my_web_project/constants/app_colors.dart';
import 'package:my_web_project/constants/app_strings.dart';
import 'package:my_web_project/models/property_type_data.dart';
import 'package:my_web_project/models/region_data.dart';
import 'package:my_web_project/models/stat_item.dart';
import 'package:provider/provider.dart';

/// DashboardProvider manages the state of the dashboard
/// It provides statistics, region data, and property type data
class DashboardProvider extends ChangeNotifier {
  /// List of statistic items for the dashboard
  final List<StatItem> _stats = [
    StatItem(
      label: AppStrings.orders,
      value: 142,
      icon: Icons.assignment,
      color: AppColors.ordersCard,
    ),
    StatItem(
      label: AppStrings.propertiesLabel,
      value: 3720,
      icon: Icons.home,
      color: AppColors.propertiesCard,
    ),
    StatItem(
      label: AppStrings.offices,
      value: 85,
      icon: Icons.apartment,
      color: AppColors.officesCard,
    ),
    StatItem(
      label: AppStrings.users,
      value: 1250,
      icon: Icons.group,
      color: AppColors.usersCard,
    ),
  ];

  /// List of region data for the bar chart
  final List<RegionData> _regions = [
    RegionData(name: AppStrings.riyadh, value: 1200),
    RegionData(name: AppStrings.jeddah, value: 850),
    RegionData(name: AppStrings.dammam, value: 620),
    RegionData(name: AppStrings.mecca, value: 580),
    RegionData(name: AppStrings.medina, value: 470),
  ];

  /// List of property type data for the pie chart
  final List<PropertyTypeData> _propertyTypes = [
    PropertyTypeData(
      label: AppStrings.apartments,
      percent: 45,
      color: AppColors.apartments,
    ),
    PropertyTypeData(
      label: AppStrings.villas,
      percent: 25,
      color: AppColors.villas,
    ),
    PropertyTypeData(
      label: AppStrings.lands,
      percent: 15,
      color: AppColors.lands,
    ),
    PropertyTypeData(
      label: AppStrings.commercialComplexes,
      percent: 10,
      color: AppColors.commercialComplexes,
    ),
    PropertyTypeData(
      label: AppStrings.officesType,
      percent: 5,
      color: AppColors.offices,
    ),
  ];

  /// Getter for statistic items
  List<StatItem> get stats => _stats;

  /// Getter for region data
  List<RegionData> get regions => _regions;

  /// Getter for property type data
  List<PropertyTypeData> get propertyTypes => _propertyTypes;

  /// Static method to get the DashboardProvider instance from the context
  /// 
  /// [context] is the BuildContext
  /// Returns the DashboardProvider instance
  static DashboardProvider of(BuildContext context) {
    return Provider.of<DashboardProvider>(context, listen: false);
  }
} 