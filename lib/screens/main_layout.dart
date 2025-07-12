import 'package:flutter/material.dart';
import 'package:my_web_project/constants/app_strings.dart';
import 'package:my_web_project/screens/dashboard_screen.dart';
import 'package:my_web_project/widgets/sidebar.dart';
import 'package:my_web_project/widgets/top_bar.dart';

/// MainLayout is the main layout for the dashboard
/// It includes the sidebar, top bar, and content area
class MainLayout extends StatefulWidget {
  /// Constructor for MainLayout
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  /// Width of the sidebar
  final double sidebarWidth = 250;
  
  /// Current screen to display in the content area
  Widget _currentScreen = const DashboardScreen();
  
  /// Current screen title to display in the top bar
  String _currentTitle = AppStrings.dashboard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        // Set text direction to RTL for Arabic
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            // Fixed sidebar
            Sidebar(width: sidebarWidth),
            
            // Main content area
            Expanded(
              child: Column(
                children: [
                  // Top bar
                  TopBar(title: _currentTitle),
                  
                  // Content area
                  Expanded(
                    child: _currentScreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Changes the current screen and title
  /// 
  /// [screen] is the new screen to display
  /// [title] is the new title to display in the top bar
  void _changeScreen(Widget screen, String title) {
    setState(() {
      _currentScreen = screen;
      _currentTitle = title;
    });
  }
} 