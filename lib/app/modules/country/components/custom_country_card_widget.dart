import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_cup_app/app/modules/country/components/custom_text_info_country_widget.dart';
import 'package:world_cup_app/app/modules/country/country_details_page.dart';
import 'package:world_cup_app/app/modules/country/models/country_model.dart';
import 'package:world_cup_app/app/modules/country/country_favorites_controller.dart';

class CustomCountryCard extends StatefulWidget {
  final Country country;

  const CustomCountryCard({super.key, required this.country});

  @override
  State<CustomCountryCard> createState() => _CustomCountryCardState();
}

class _CustomCountryCardState extends State<CustomCountryCard> {
  showCountryDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CountryDetailsPage(country: widget.country),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        onTap: () => showCountryDetailsPage(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Image.asset(
                widget.country.flag,
                height: 40,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextInfoCountry(title: widget.country.name),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  widget.country.titles.toString(),
                ),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ListTile(
                      title: const Text('Remover dos Favoritos!'),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<CountryFavoritesController>(context,
                                listen: false)
                            .removeFavorites(widget.country);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Removido dos Favoritos!"),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
