import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.type,
    this.prefixIcon,
    this.suffixIcon, required this.controller, this.validator,
  });

  final String labelText;
  final TextInputType type;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76, // Increased height
      width: double.infinity,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20), // Adjust padding for increased height
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),

          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          prefixIcon: Icon(prefixIcon, size: 28),
          suffixIcon: Icon(suffixIcon, size: 28),
        ),
        keyboardType: type,
      ),
    );
  }
}
