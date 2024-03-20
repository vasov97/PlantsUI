import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';

class RoundedTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final Color color;
  final Color iconColor;
  final TextInputType inputType;
  final bool isPassword;
  final bool isSearchField;

  const RoundedTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.color,
    required this.iconColor,
    required this.inputType,
    this.isPassword = false,
    this.isSearchField = false,
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: widget.iconColor,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: TextField(
                obscureText: _isObscured,
                keyboardType: widget.inputType,
                controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                ),
              ),
            ),
            if (widget.isPassword)
              IconButton(
                icon: Icon(
                  !_isObscured ? Icons.visibility : Icons.visibility_off,
                  color: widget.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
            if (widget.isSearchField)
              Icon(
                Icons.mic,
                color: AppColors.iconsGreen,
              ),
          ],
        ),
      ),
    );
  }
}
