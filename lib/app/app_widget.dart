import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_app/app/modules/home/home_page.dart';
import 'package:world_cup_app/app/modules/login/login_page.dart';
import 'package:world_cup_app/app/modules/splash/splash_page.dart';
import 'package:world_cup_app/app/app_theme_controller.dart';
import 'package:world_cup_app/app/modules/country/country_favorites_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

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
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple, brightness: value.themeMode),
              useMaterial3: true,
            ),
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
