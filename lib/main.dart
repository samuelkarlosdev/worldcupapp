import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_app/pages/home_page.dart';
import 'package:world_cup_app/repositories/country_favorites_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountryFavoritesRepository(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
