import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onDestinationSelected;

  const CustomNavigationBar(
      {super.key,
      required this.selectedIndex,
      required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: Colors.white70,
        elevation: 1,
        indicatorColor: Colors.lightBlue.withOpacity(0.1),
        labelTextStyle: const MaterialStatePropertyAll(
          TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.list_outlined,
              size: 30,
              color: Colors.grey,
            ),
            selectedIcon: Icon(
              Icons.list,
              size: 30,
              color: Colors.blue,
            ),
            label: "Seleções",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite_outline,
              size: 30,
              color: Colors.grey,
            ),
            selectedIcon: Icon(
              Icons.favorite,
              size: 30,
              color: Colors.blue,
            ),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
