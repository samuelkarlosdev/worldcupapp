import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CountryFavoritesPage extends StatefulWidget {
  const CountryFavoritesPage({super.key});

  @override
  State<CountryFavoritesPage> createState() => _CountryFavoritesPageState();
}

class _CountryFavoritesPageState extends State<CountryFavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seleções Favoritas"),
      ),
    );
  }
}
