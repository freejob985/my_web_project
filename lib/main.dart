import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_web_project/constants/app_strings.dart';
import 'package:my_web_project/constants/app_theme.dart';
import 'package:my_web_project/providers/dashboard_provider.dart';
import 'package:my_web_project/providers/menu_provider.dart';
import 'package:my_web_project/screens/main_layout.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Entry point of the application
void main() {
  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatelessWidget {
  /// Constructor for MyApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Register providers
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MaterialApp(
        // App title
        title: AppStrings.appName,
        
        // Disable debug banner
        debugShowCheckedModeBanner: false,
        
        // Apply theme
        theme: AppTheme.lightTheme,
        
        // Set up responsive framework for better responsiveness
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        
        // Set up localization for Arabic
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', ''), // Arabic
        ],
        locale: const Locale('ar', ''),
        
        // Set home screen to MainLayout
        home: const MainLayout(),
      ),
    );
  }
}
