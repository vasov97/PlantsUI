import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';

class RememberMeRow extends StatefulWidget {
  const RememberMeRow({super.key});

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isSelected = !_isSelected;
                });
              },
              child: Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.iconsGreen,
                  ),
                  color:
                      _isSelected ? AppColors.iconsGreen : Colors.transparent,
                ),
                child: _isSelected
                    ? const Icon(
                        Icons.check,
                        size: 16.0,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Remember me',
              style: TextStyle(color: AppColors.appGrey),
            ),
          ],
        ),
        const Text(
          'Forgot password?',
          style: TextStyle(
            color: AppColors.iconsGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
