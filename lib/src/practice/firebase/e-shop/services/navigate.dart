import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/practice/firebase/e-shop/account_page/account_page.dart';
import 'package:portfolio/src/practice/firebase/e-shop/e_shop_page_home.dart';
import 'package:portfolio/src/practice/firebase/e-shop/explore_page/explore_page.dart';
import 'package:portfolio/src/practice/firebase/e-shop/favorit_page/favorit_page.dart';

class Navigate extends StatefulWidget {
  const Navigate({Key? key}) : super(key: key);

  State<Navigate> createState() => _NavigateState();
}

List screens = const [
  EShopHomePage(),
  ExplorePage(),
  FavoritePage(),
  AccountPage(),
];

class _NavigateState extends State<Navigate> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
