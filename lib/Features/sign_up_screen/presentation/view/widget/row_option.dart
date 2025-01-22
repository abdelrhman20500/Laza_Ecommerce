import 'package:flutter/material.dart';

class RowOption extends StatelessWidget {
  final String title;
  final bool switchValue;
  final Function(bool) onChanged;

  const RowOption({
    required this.title,
    required this.switchValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(title,style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
        const Spacer(),
        Switch(
          value: switchValue,
          onChanged: onChanged,
          activeColor: const Color(0xff34C759),
        ),
      ],
    );
  }
}
