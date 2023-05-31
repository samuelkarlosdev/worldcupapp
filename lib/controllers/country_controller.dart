import 'package:flutter/material.dart';
import 'package:world_cup_app/repositories/country_repository.dart';

import '../models/country_model.dart';

class CountryController {
  final CountryRepository _countryRepository;
  CountryController(this._countryRepository);

  ValueNotifier<List<Country>> country = ValueNotifier<List<Country>>([]);

  fetch() async {
    country.value = await _countryRepository.getCountry();
  }
}
