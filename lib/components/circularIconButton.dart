import "package:flutter/material.dart";

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const CircularIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed(),
      elevation: 6,
      shape: const CircleBorder(),
      fillColor: const Color(0xff4c4f5e),
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      child: Icon(icon, color: Colors.white,),
    );
  }
}
