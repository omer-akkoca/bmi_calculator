import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  Color color;
  Widget children;
  Function ?onPressed = (){};

  CardContainer({
    super.key,
    required this.color,
    required this.children,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed!(),
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        child: children,
      ),
    );
  }
}