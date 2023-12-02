import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:world_cup_app/app/core/database/database_helper.dart';
import 'package:world_cup_app/app/modules/country/models/country_model.dart';

class CountryFavoritesController extends ChangeNotifier {
  late Database db;
  late List<Country> _listCountry = [];
  List<Country> get listCountry => _listCountry;

  CountryFavoritesController() {
    _initController();
  }

  _initController() async {
    await _getListCountry();
  }

  Future<List<Country>> _getListCountry() async {
    try {
      db = await DatabaseHelper.instance.database;
      var countryFavorites =
          await db.query('countryfavorites', orderBy: 'titles DESC');

      /*List countryJson = jsonDecode(value);
    return countryJson.map((e) => Country.fromJson(e)).toList();*/

      _listCountry = countryFavorites.isNotEmpty
          ? countryFavorites.map((e) => Country.fromMap(e)).toList()
          : [];
      return _listCountry;
    } catch (e) {
      //return ;
      return [];
    }
  }

  Future saveAllFavorites(List<Country> countrysSelecteds) async {
    try {
      db = await DatabaseHelper.instance.database;

      for (var country in countrysSelecteds) {
        await db.rawQuery('SELECT * FROM countryfavorites WHERE name IN (?)',
            [country.name]).then((queryResult) {
          if (queryResult.isEmpty) {
            //print(country.name + " NÃO existe!");
            db.insert('countryfavorites', country.toMap());
            _listCountry.add(country);
            notifyListeners();
          } else {
            //print(country.name + " Já existe!");
          }
        });
      }
    } catch (e) {
      //print(e);
      return;
    }

    // https://github.com/tekartik/sqflite/blob/master/sqflite/doc/sql.md
    // https://balta.io/blog/flutter-sqlite

    //db = await DatabaseHelper.instance.database;
    //return await db.insert('countryfavorites', countrys.toMap());
    //await db.execute("DROP TABLE IF EXISTS countryfavorites");
    //notifyListeners();
    //notifyListeners();
    //return 1;
    /*db = await DatabaseHelper.instance.database;
    await db.execute("DROP TABLE IF EXISTS countryfavorites");*/
  }

  Future removeFavorites(Country country) async {
    try {
      await db.delete(
        'countryfavorites',
        where: "name = ?",
        whereArgs: [country.name],
      ).then((value) {
        _listCountry.remove(country);
        notifyListeners();
      });
    } catch (e) {
      //print(e);
      return;
    }
  }
}
