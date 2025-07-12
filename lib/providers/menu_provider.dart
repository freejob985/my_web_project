import 'package:flutter/material.dart';
import 'package:my_web_project/constants/app_strings.dart';
import 'package:my_web_project/models/menu_item.dart';
import 'package:provider/provider.dart';

/// MenuProvider manages the state of the sidebar menu
/// It provides the list of menu items and handles menu item expansion
class MenuProvider extends ChangeNotifier {
  /// List of menu items in the sidebar
  final List<MenuItem> _menuItems = [
    MenuItem(
      label: AppStrings.home,
      icon: Icons.home,
    ),
    MenuItem(
      label: AppStrings.dashboard,
      icon: Icons.dashboard,
    ),
    MenuItem(
      label: AppStrings.properties,
      icon: Icons.home_work,
      subItems: [
        MenuItem(
          label: AppStrings.manageProperties,
          icon: Icons.list,
        ),
      ],
    ),
    MenuItem(
      label: AppStrings.residentialComplexes,
      icon: Icons.apartment,
      subItems: [
        MenuItem(
          label: AppStrings.manageComplexes,
          icon: Icons.list,
        ),
      ],
    ),
    MenuItem(
      label: AppStrings.realEstateOffices,
      icon: Icons.business,
      subItems: [
        MenuItem(
          label: AppStrings.manageOffices,
          icon: Icons.list,
        ),
      ],
    ),
    MenuItem(
      label: AppStrings.addAdvertisement,
      icon: Icons.add_box,
    ),
    MenuItem(
      label: AppStrings.systemSettings,
      icon: Icons.settings,
    ),
  ];

  /// Getter for menu items
  List<MenuItem> get menuItems => _menuItems;

  /// Currently selected menu item index
  int _selectedIndex = 0;

  /// Getter for selected index
  int get selectedIndex => _selectedIndex;

  /// Sets the selected menu item index and notifies listeners
  /// 
  /// [index] is the index of the selected menu item
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  /// Toggles the expansion state of a menu item and notifies listeners
  /// 
  /// [index] is the index of the menu item to toggle
  void toggleExpanded(int index) {
    if (_menuItems[index].subItems != null) {
      _menuItems[index].isExpanded = !_menuItems[index].isExpanded;
      notifyListeners();
    }
  }

  /// Static method to get the MenuProvider instance from the context
  /// 
  /// [context] is the BuildContext
  /// Returns the MenuProvider instance
  static MenuProvider of(BuildContext context) {
    return Provider.of<MenuProvider>(context, listen: false);
  }
} 