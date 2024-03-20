import 'package:flutter/material.dart';
import 'package:plants_ui/widgets/custom_clipper.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ClipPath(
      clipper: CurvedBottomClipper(),
      child: SizedBox(
        height: 250,
        width: screenWidth,
        child: Image.asset(
          'assets/1.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
