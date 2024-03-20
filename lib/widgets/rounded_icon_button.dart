import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final Color color;
  final Color iconColor;
  final double padding;

  const RoundedIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.size = 48.0,
      this.color = Colors.blue,
      this.iconColor = Colors.white,
      this.padding = 9});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.only(left: padding),
        icon: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
