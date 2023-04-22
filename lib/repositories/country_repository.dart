import 'package:world_cup_app/models/country_model.dart';

class CountryRepository {
  static List<Country> countryList = [
    Country(name: 'Brasil', flag: 'images/brasil.png', titles: 5),
    Country(name: 'Alemanha', flag: 'images/alemanha.png', titles: 4),
    Country(name: 'Itália', flag: 'images/italia.png', titles: 4),
    Country(name: 'Argentina', flag: 'images/argentina.png', titles: 3),
    Country(name: 'França', flag: 'images/franca.png', titles: 2),
    Country(name: 'Urugaui', flag: 'images/uruguai.png', titles: 2),
    Country(name: 'Espanha', flag: 'images/espanha.png', titles: 1),
    Country(name: 'Inglaterra', flag: 'images/inglaterra.png', titles: 1),
  ];
}
