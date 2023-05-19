import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_app/pages/home_page.dart';
import 'package:world_cup_app/repositories/app_theme_repository.dart';
import 'package:world_cup_app/repositories/country_favorites_repository.dart';
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
          create: (context) => CountryFavoritesRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppThemeRepository(),
        ),
      ],
      child: Consumer<AppThemeRepository>(
        builder: (context, value, child) {
          return MaterialApp(
            themeMode: value.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
