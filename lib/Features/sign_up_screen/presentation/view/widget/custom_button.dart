import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.onPressed,this.width,this.height,this.color});
  String text;
  void Function()? onPressed;
  double? width;
  double? height;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(28),
          color: color),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(text,
          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
    );
  }
}
