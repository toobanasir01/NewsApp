import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Icon icon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.icon,
      required this.controller,
      required this.label,
      required this.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
          labelText: label,
          labelStyle: TextStyle(color: Colors.indigo),
          prefixIcon: icon,
          focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo))
        ),
      ),
    );
  }
}
