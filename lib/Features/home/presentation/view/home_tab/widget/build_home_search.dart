import 'package:flutter/material.dart';

class BuildHomeSearch extends StatelessWidget {
  const BuildHomeSearch({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
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
              labelText: "Search...",
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8.0),
          height: MediaQuery.of(context).size.height * 0.066,
          width: MediaQuery.of(context).size.width * 0.14,
          decoration: BoxDecoration(
            color: const Color(0xff9775FA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_voice,
                color: Colors.white, size: 32),
          ),
        ),
      ],
    );
  }
}
