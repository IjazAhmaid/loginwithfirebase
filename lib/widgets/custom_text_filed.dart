import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController conroler;
  final String labelText;
  final String hintText;
  final bool obscureText;

  const CustomTextFiled({
    Key? key,
    required this.conroler,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: conroler,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          filled: true,
          fillColor: const Color(0x00000fff)),
    );
  }
}
