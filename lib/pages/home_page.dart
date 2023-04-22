import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:world_cup_app/repositories/country_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final countryList = CountryRepository.countryList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Copa do Mundo'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int country) {
            return ListTile(
              leading: Image.asset(countryList[country].flag),
              title: Text(countryList[country].name),
              trailing: Text(countryList[country].titles.toString()),
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: countryList.length),
    );
  }
}
