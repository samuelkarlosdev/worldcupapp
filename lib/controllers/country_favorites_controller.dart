import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:world_cup_app/models/country_model.dart';

class CountryFavoritesController extends ChangeNotifier {
  final List<Country> _listCountry = [];

  UnmodifiableListView<Country> get listCountry =>
      UnmodifiableListView(_listCountry);

  saveAllFavorites(List<Country> countrys) {
    for (var country in countrys) {
      if (!_listCountry.contains(country)) _listCountry.add(country);
    }
    notifyListeners();
  }

  removeFavorites(Country country) {
    _listCountry.remove(country);
    notifyListeners();
  }
}
