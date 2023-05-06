import 'package:flutter/material.dart';
import 'package:world_cup_app/models/country_model.dart';
import 'package:world_cup_app/widgets/custom_text_title_info_country.dart';

import '../widgets/custom_text_info_country.dart';

class CountryDetailsPage extends StatefulWidget {
  Country country;

  CountryDetailsPage({super.key, required this.country});

  @override
  State<CountryDetailsPage> createState() => _CountryDetailsPageState();
}

class _CountryDetailsPageState extends State<CountryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.country.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Image.asset(widget.country.flag),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomTextTitleInfoCountry(title: 'Títulos'),
                CustomTextInfoCountry(title: widget.country.titlesforyears),
                const SizedBox(height: 10),
                const CustomTextTitleInfoCountry(title: 'Vices'),
                CustomTextInfoCountry(title: widget.country.vicesyears),
                const SizedBox(height: 10),
                const CustomTextTitleInfoCountry(title: '3° Lugar'),
                CustomTextInfoCountry(title: widget.country.thirdplaceyears),
                const SizedBox(height: 10),
                const CustomTextTitleInfoCountry(title: '4° Lugar'),
                CustomTextInfoCountry(title: widget.country.fourthplaceyear),
              ],
            )
          ],
        ),
      ),
    );
  }
}
