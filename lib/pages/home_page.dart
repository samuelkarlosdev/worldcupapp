import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:world_cup_app/pages/country_favorites_page.dart';
import 'package:world_cup_app/pages/country_page.dart';
import 'package:world_cup_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:world_cup_app/widgets/custom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  setCurrentPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: setCurrentPage,
        children: const [
          CountryPage(),
          CountryFavoritesPage(),
        ],
      ),

      // Use CustomBottomNavigationBar or CustomNavigationBar
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: currentPage,
        onDestinationSelected: (int page) {
          pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
