import 'package:flutter/material.dart';

class CustomTextInfoCountry extends StatelessWidget {
  final String title;

  const CustomTextInfoCountry({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
