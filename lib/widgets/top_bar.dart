import 'package:flutter/material.dart';
import 'package:my_web_project/constants/app_colors.dart';
import 'package:my_web_project/constants/app_strings.dart';

/// TopBar widget displays the white top bar with the page title
class TopBar extends StatelessWidget {
  /// Title to display in the top bar
  final String title;

  /// Constructor for TopBar
  /// 
  /// [title] is the title to display
  const TopBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Page title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const Spacer(),
          
          // User profile and actions could be added here
          // For now, just a placeholder icon
          const CircleAvatar(
            backgroundColor: AppColors.lightGrey,
            radius: 18,
            child: Icon(
              Icons.person,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
} 