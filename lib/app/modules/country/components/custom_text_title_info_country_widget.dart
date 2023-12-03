import 'package:flutter/material.dart';

class CustomTextTitleInfoCountry extends StatelessWidget {
  final String title;

  const CustomTextTitleInfoCountry({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
