import 'package:world_cup_app/models/country_model.dart';

/*class CountryRepository {
  static List<Country> countryList = [
    Country(
        name: 'Brasil',
        flag: 'images/brasil.png',
        titles: 5,
        titlesforyears: '1958, 1962, 1970, 1994 e 2002',
        vicesyears: '1950 e 1998',
        thirdplaceyears: '1938 e 1978',
        fourthplaceyear: '1974 e 2014'),
    Country(
        name: 'Alemanha',
        flag: 'images/alemanha.png',
        titles: 4,
        titlesforyears: '1954, 1974, 1990 e 2014',
        vicesyears: '1966, 1982, 1986 e 2002',
        thirdplaceyears: '1934, 1970, 2006 e 2010',
        fourthplaceyear: '1958'),
    Country(
        name: 'Itália',
        flag: 'images/italia.png',
        titles: 4,
        titlesforyears: '1934, 1938, 1982 e 2006',
        vicesyears: '1970 e 1994',
        thirdplaceyears: '1990',
        fourthplaceyear: '1978'),
    Country(
        name: 'Argentina',
        flag: 'images/argentina.png',
        titles: 3,
        titlesforyears: '1978, 1986 e 2022',
        vicesyears: '1930, 1990 e 2014',
        thirdplaceyears: '-',
        fourthplaceyear: '-'),
    Country(
        name: 'França',
        flag: 'images/franca.png',
        titles: 2,
        titlesforyears: '1998 e 2018',
        vicesyears: '2006 e 2022',
        thirdplaceyears: '1958 e 1986',
        fourthplaceyear: '1982'),
    Country(
        name: 'Uruguai',
        flag: 'images/uruguai.png',
        titles: 2,
        titlesforyears: '1930 e 1950',
        vicesyears: '-',
        thirdplaceyears: '-',
        fourthplaceyear: '1954, 1970 e 2010'),
    Country(
        name: 'Espanha',
        flag: 'images/espanha.png',
        titles: 1,
        titlesforyears: '2010',
        vicesyears: '-',
        thirdplaceyears: '-',
        fourthplaceyear: '1950'),
    Country(
        name: 'Inglaterra',
        flag: 'images/inglaterra.png',
        titles: 1,
        titlesforyears: '1966',
        vicesyears: '-',
        thirdplaceyears: '-',
        fourthplaceyear: '1990 e 2018'),
  ];
}*/

abstract class CountryRepository {
  Future<List<Country>> getCountry();
}
