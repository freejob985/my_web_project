import 'package:flutter/material.dart';
import 'package:my_web_project/constants/app_colors.dart';
import 'package:my_web_project/models/stat_item.dart';

/// StatCard widget displays a statistic in a card with an icon
class StatCard extends StatelessWidget {
  /// The statistic data to display
  final StatItem stat;

  /// Constructor for StatCard
  /// 
  /// [stat] is the statistic data to display
  const StatCard({
    super.key,
    required this.stat,
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
        child: Row(
          children: [
            // Colored icon container
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: stat.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  stat.icon,
                  color: stat.color,
                  size: 30,
                ),
              ),
            ),
            
            const SizedBox(width: 20),
            
            // Statistic value and label
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stat.value.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    stat.label,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 