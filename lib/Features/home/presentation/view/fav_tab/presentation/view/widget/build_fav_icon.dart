import 'package:flutter/material.dart';

class BuildFavIcon extends StatelessWidget {
  const BuildFavIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 2,right: 2,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.favorite_border,color: Colors.grey,size: 30,),
      ),
    );
  }
}
