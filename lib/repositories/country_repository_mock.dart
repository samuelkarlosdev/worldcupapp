import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:world_cup_app/models/country_model.dart';
import 'package:world_cup_app/repositories/country_repository.dart';

class CountryRepositoryMock implements CountryRepository {
  @override
  Future<List<Country>> getCountry() async {
    var value = await rootBundle.loadString('assets/data.json');

    List countryJson = jsonDecode(value);
    return countryJson.map((e) => Country.fromJson(e)).toList();
  }
}
