import 'package:flutter/material.dart';
import 'package:caclulator/colors.dart';


class CalcButton extends StatelessWidget {
  CalcButton({
    required this.child,
    required this.onTap,
    this.size = 80,
    this.backgroundColor = buttonsColor,
    this.shadowColor = Colors.deepOrange,
  });

  final Widget child;
  final Function() onTap;
  final double size;
  final Color backgroundColor;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            child: child,
            width: size,
            height: size,
            decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                      color: shadowColor.withOpacity(0.0),
                      offset: const Offset(1, 1),
                      blurRadius: 2),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
          ),
          Container(
            width: size,
            height: size,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                // highlightColor: Colors.white,
                splashColor: splashColor.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                // radius: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
