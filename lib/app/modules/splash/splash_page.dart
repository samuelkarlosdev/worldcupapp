import 'package:flutter/material.dart';
import 'package:world_cup_app/shared/themes/themes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightTheme.primaryColor,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
