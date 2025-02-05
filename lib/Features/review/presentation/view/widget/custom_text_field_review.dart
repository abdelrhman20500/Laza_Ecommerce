import 'package:flutter/material.dart';

class CustomTextFieldReview extends StatelessWidget {
  const CustomTextFieldReview({
    super.key,
    required this.controller,
    required this.hintText,
    this.type,
    this.suffixIcon,
    this.minLine,
    this.maxLine});
  final int? maxLine;
  final int? minLine;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      maxLines: maxLine,
      minLines: minLine,
      controller : controller,
      decoration:InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.white10,
        filled: true,

      ),
    );
  }
}