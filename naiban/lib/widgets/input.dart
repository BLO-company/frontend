import 'package:flutter/material.dart';
import 'package:naiban/themes/my_theme.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final TextInputType? textInputType;
  final bool obscureText;
  final TextEditingController? ctrl;

  const Input({
    super.key,
    this.hintText,
    this.textInputType,
    this.obscureText = false,
    this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 364,
      height: 40,
      child: TextFormField(
        controller: ctrl,
        textAlignVertical: TextAlignVertical.bottom,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppTheme.white3),
          filled: true,
          fillColor: AppTheme.white2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
