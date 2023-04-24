import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:world_cup_app/models/country_model.dart';
import 'package:world_cup_app/repositories/country_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final countryList = CountryRepository.countryList;
  List<Country> listCountrySelected = [];

  appBarDynamic() {
    if (listCountrySelected.isEmpty) {
      return AppBar(
        title: const Text('Copa do Mundo'),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              listCountrySelected = [];
            });
          },
        ),
        title: (listCountrySelected.length <= 1)
            ? Text('${listCountrySelected.length} selecionado')
            : Text('${listCountrySelected.length} selecionados'),
        backgroundColor: Colors.blueAccent[50],
        elevation: 1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDynamic(),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int country) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              leading: (listCountrySelected.contains(countryList[country]))
                  ? const CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : Image.asset(countryList[country].flag),
              title: Text(countryList[country].name),
              trailing: Text(
                countryList[country].titles.toString(),
              ),
              selected: listCountrySelected.contains(countryList[country]),
              selectedTileColor: Colors.blue[50],
              onLongPress: () {
                setState(() {
                  (listCountrySelected.contains(countryList[country]))
                      ? listCountrySelected.remove(countryList[country])
                      : listCountrySelected.add(countryList[country]);
                });
              },
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: countryList.length),
    );
  }
}
