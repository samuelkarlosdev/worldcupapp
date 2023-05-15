import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:world_cup_app/models/country_model.dart';

class CountryFavoritesRepository extends ChangeNotifier {
  List<Country> _listCountry = [];

  UnmodifiableListView<Country> get listCountry =>
      UnmodifiableListView(_listCountry);

  saveAllFavorites(List<Country> countrys) {
    countrys.forEach((country) {
      if (!_listCountry.contains(country)) _listCountry.add(country);
    });
    notifyListeners();
  }

  removeFavorites(Country country) {
    _listCountry.remove(country);
    notifyListeners();
  }
}
