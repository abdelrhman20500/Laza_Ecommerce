import 'package:flutter/material.dart';

class BuildCustomSearch extends StatelessWidget {
  const BuildCustomSearch({super.key, required this.name, required this.iconData});
  final String name;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        labelText: name,
        prefixIcon:  Icon(iconData),
      ),
    );
  }
}
