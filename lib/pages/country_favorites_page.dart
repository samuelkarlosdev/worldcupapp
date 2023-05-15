import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_app/repositories/country_favorites_repository.dart';

import '../widgets/custom_country_card.dart';

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
        title: const Text("Seleções Favoritas"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12.0),
        child: Consumer<CountryFavoritesRepository>(
          builder: (context, countryFavorites, child) {
            return countryFavorites.listCountry.isEmpty
                ? const ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Ainda não há seleções favoritas!'),
                  )
                : ListView.builder(
                    itemCount: countryFavorites.listCountry.length,
                    itemBuilder: (_, index) {
                      return CustomCountryCard(
                          country: countryFavorites.listCountry[index]);
                    },
                  );
          },
        ),
      ),
    );
  }
}
