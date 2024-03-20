import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';
import 'package:plants_ui/pages/cart_page.dart';
import 'package:plants_ui/pages/main_page.dart';
import 'package:plants_ui/pages/plant_list_page.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainPage(),
    const CartPage(),
    const PlantListPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
              color: AppColors.lightGreen,
            ),
            activeIcon: Icon(
              Icons.home,
              color: AppColors.iconsGreen,
            ),
          ),
          const BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.shopping_cart,
              color: AppColors.lightGreen,
            ),
            activeIcon: Icon(
              Icons.shopping_cart,
              color: AppColors.iconsGreen,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/3d-model.png',
              color: AppColors.lightGreen,
              width: 30,
              height: 30,
            ),
            activeIcon: Image.asset(
              'assets/3d-model.png',
              color: AppColors.iconsGreen,
              width: 30,
              height: 30,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
