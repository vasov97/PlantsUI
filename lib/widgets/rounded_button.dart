import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RoundedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.iconsGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
