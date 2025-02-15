import 'package:flutter/material.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.hourglass_empty,size: 54,),
          Text('There is no orders now!',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
