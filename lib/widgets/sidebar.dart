import 'package:flutter/material.dart';
import 'package:my_web_project/constants/app_colors.dart';
import 'package:my_web_project/constants/app_strings.dart';
import 'package:my_web_project/models/menu_item.dart';
import 'package:my_web_project/providers/menu_provider.dart';
import 'package:provider/provider.dart';

/// Sidebar widget displays the fixed blue sidebar with menu items
class Sidebar extends StatelessWidget {
  /// Width of the sidebar
  final double width;

  /// Constructor for Sidebar
  /// 
  /// [width] is the width of the sidebar
  const Sidebar({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: AppColors.primary,
      child: Column(
        children: [
          // App title at the top of the sidebar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            alignment: Alignment.center,
            child: Text(
              AppStrings.appName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          const Divider(color: Colors.white24, height: 1),
          
          // List of menu items
          Expanded(
            child: Consumer<MenuProvider>(
              builder: (context, menuProvider, _) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: menuProvider.menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuProvider.menuItems[index];
                    return _buildMenuItem(context, item, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a menu item widget
  /// 
  /// [context] is the BuildContext
  /// [item] is the MenuItem to build
  /// [index] is the index of the menu item
  /// Returns a Widget representing the menu item
  Widget _buildMenuItem(BuildContext context, MenuItem item, int index) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final isSelected = menuProvider.selectedIndex == index;
    
    return Column(
      children: [
        // Main menu item
        InkWell(
          onTap: () {
            menuProvider.setSelectedIndex(index);
            if (item.subItems != null) {
              menuProvider.toggleExpanded(index);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
            child: Row(
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    item.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (item.subItems != null)
                  Icon(
                    item.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
        
        // Submenu items if expanded
        if (item.subItems != null && item.isExpanded)
          ...item.subItems!.map((subItem) {
            return InkWell(
              onTap: () {
                // Handle submenu item tap
              },
              child: Container(
                padding: const EdgeInsets.only(left: 52, right: 16, top: 12, bottom: 12),
                color: Colors.white.withOpacity(0.05),
                child: Row(
                  children: [
                    Icon(
                      subItem.icon,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      subItem.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
      ],
    );
  }
} 