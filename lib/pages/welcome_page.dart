import 'package:flutter/material.dart';
import 'package:plants_ui/widgets/glass_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/1.jpg', fit: BoxFit.cover),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 40, top: 80, bottom: screenHeight * 0.25),
                child: const Text(
                  'The best\napp for\nyour plants',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GlassButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/login',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/register'),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Create an accoint',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
