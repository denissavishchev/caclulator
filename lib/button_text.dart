import 'package:caclulator/colors.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  ButtonText({
    required this.text,
    this.size = 30,
    this.color = Colors.white,
  });
  final String text;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        // textAlign: TextAlign.center,
        style: TextStyle(fontSize: size, color: color),
      ),
    );
  }
}
