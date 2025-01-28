import 'package:flutter/material.dart';

class BuildHomeCategory extends StatelessWidget {
  const BuildHomeCategory({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.044,
              width: MediaQuery.of(context).size.width * 0.09,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Image(
                  image: AssetImage("assets/images/vector.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              "Adidas",
              style: TextStyle(fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
