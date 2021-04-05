import 'package:flutter/material.dart';
import 'package:werewolf_client/app/constants/constants.dart';

class WidgetInputUnderline extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextStyle hintStyle;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onFieldSubmitted;
  final EdgeInsets contentPadding;
  final TextInputType inputType;
  final Widget suffixIcon;
  final bool obscureText;

  WidgetInputUnderline(
      {this.controller,
      this.inputType,
      this.hint,
      this.hintStyle,
      this.obscureText,
      this.suffixIcon,
      this.onChanged,
      this.onFieldSubmitted,
      this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType ?? TextInputType.text,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ?? const EdgeInsets.all(16),
          hintStyle: hintStyle,
          hintText: hint,
          enabledBorder: _border,
          border: _border),
    );
  }

  final InputBorder _border = UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: TEXT_HINT_COLOR));
}
