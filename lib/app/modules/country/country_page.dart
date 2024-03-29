import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_app/app/modules/country/components/custom_text_info_country_widget.dart';
import 'package:world_cup_app/app/modules/country/country_controller.dart';
import 'package:world_cup_app/app/modules/country/country_details_page.dart';
import 'package:world_cup_app/app/modules/country/models/country_model.dart';
import 'package:world_cup_app/app/app_theme_controller.dart';
import 'package:world_cup_app/app/modules/country/country_favorites_controller.dart';
import 'package:world_cup_app/app/modules/country/repositories/country_repository_mock.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final CountryController _countryController =
      CountryController(CountryRepositoryMock());

  //final countryList = CountryRepository.countryList;
  List<Country> listCountrySelected = [];
  late CountryFavoritesController countryFavoritesController;
  late AppThemeController appThemeController;

  @override
  void initState() {
    super.initState();
    _countryController.fetch();
  }

  changeTheme() {
    return PopupMenuButton(
      icon: const Icon(Icons.brightness_medium_sharp),
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        /*PopupMenuItem(
          child: RadioListTile<ThemeMode>(
            value: ThemeMode.system,
            groupValue: appThemeController.themeMode,
            title: const Text('System'),
            onChanged: (ThemeMode? value) {
              appThemeController.switchTheme(value);
              Navigator.pop(context);
            },
          ),
        ),*/
        PopupMenuItem(
          child: RadioListTile<Brightness>(
            value: Brightness.light,
            groupValue: appThemeController.themeMode,
            title: const Text('Light'),
            onChanged: (Brightness? value) {
              appThemeController.switchTheme(value);
              Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: RadioListTile<Brightness>(
            value: Brightness.dark,
            groupValue: appThemeController.themeMode,
            title: const Text('Dark'),
            onChanged: (Brightness? value) {
              appThemeController.switchTheme(value);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  appBarDynamic() {
    if (listCountrySelected.isEmpty) {
      return AppBar(
        title: const Text('Copa do Mundo'),
        actions: [changeTheme()],
        automaticallyImplyLeading: false,
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

  showCountryDetailsPage(Country country) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CountryDetailsPage(country: country),
      ),
    );
  }

  cleanCountrySelecteds() {
    setState(() {
      listCountrySelected = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    //countryFavorites = Provider.of<CountryFavoritesRepository>(context);
    countryFavoritesController =
        Provider.of<CountryFavoritesController>(context);
    appThemeController = Provider.of<AppThemeController>(context);

    //print(countryFavoritesController.listCountry.toString());

    return Scaffold(
      appBar: appBarDynamic(),
      body: ValueListenableBuilder<List<Country>>(
          valueListenable: _countryController.country,
          builder: (_, countryList, __) {
            return ListView.separated(
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
                  title: Row(
                    children: [
                      CustomTextInfoCountry(
                        title: countryList[country].name,
                      ),
                      /*if (countryFavoritesController.listCountry.contains(countryList[country]))
                        const Icon(Icons.circle, color: Colors.amber, size: 8),*/
                    ],
                  ),
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
                  onTap: () => showCountryDetailsPage(countryList[country]),
                );
              },
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: countryList.length,
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: listCountrySelected.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                countryFavoritesController
                    .saveAllFavorites(listCountrySelected);
                cleanCountrySelecteds();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Adicionado aos Favoritos!"),
                    duration: Duration(seconds: 5),
                  ),
                );
              },
              icon: const Icon(Icons.star),
              label: const Text(
                'FAVORITAR',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
