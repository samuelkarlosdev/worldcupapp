import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_app/pages/home_page.dart';
import 'package:world_cup_app/pages/login_page.dart';
import 'package:world_cup_app/pages/splash_page.dart';
import 'package:world_cup_app/controllers/app_theme_controller.dart';
import 'package:world_cup_app/controllers/country_favorites_controller.dart';
import 'package:world_cup_app/shared/themes/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountryFavoritesController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppThemeController(),
        ),
      ],
      child: Consumer<AppThemeController>(
        builder: (context, value, child) {
          return MaterialApp(
            themeMode: value.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            initialRoute: '/splash',
            routes: {
              '/splash': (_) => const SplashPage(),
              '/login': (_) => LoginPage(),
              '/home': (_) => const HomePage(),
            },
          );
        },
      ),
    );
  }
}
