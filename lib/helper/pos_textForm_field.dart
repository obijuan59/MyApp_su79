import 'package:flutter/material.dart';
import 'package:MyApp/helper/style.dart';

class PosTextformField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const PosTextformField({
    super.key,
    this.controller,
    this.label,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator, // only runs when form.validate() is called
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: placeholder,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: StyleColor.filledBackground,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
