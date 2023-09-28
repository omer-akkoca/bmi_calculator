import 'package:bmi_calculator/constants/styles.dart';
import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {

  final IconData icon;
  final String title;

  const IconCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: Colors.white,),
        const SizedBox(height: 15),
        Text(title, style: kTitleStyle)
      ],
    );
  }
}