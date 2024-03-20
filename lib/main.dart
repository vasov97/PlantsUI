import 'package:flutter/material.dart';
import 'package:plants_ui/pages/cart_page.dart';
import 'package:plants_ui/pages/login_page.dart';
import 'package:plants_ui/pages/main_page.dart';
import 'package:plants_ui/pages/my_main_page.dart';
import 'package:plants_ui/pages/plant_list_page.dart';
import 'package:plants_ui/pages/register_page.dart';
import 'package:plants_ui/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/list-page': (context) => const PlantListPage(),
        '/main-page': (context) => const MainPage(),
        '/my-main-page': (context) => const MyMainPage(),
        '/cart-page': (context) => const CartPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: Scaffold(
          body: WelcomePage(),
        ),
      ),
    );
  }
}
