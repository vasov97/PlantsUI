import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({
    super.key,
    required this.index,
    required this.category,
    required this.onClick,
    required this.clicked,
  });
  final int index;
  final List category;
  final Function() onClick;
  final int clicked;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: widget.onClick,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: widget.clicked == widget.index
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.lightGreen,
                        AppColors.lightGreen,
                      ]),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Center(
            child: Text(
              widget.category[widget.index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.clicked == widget.index
                      ? AppColors.iconsGreen
                      : Colors.grey,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
