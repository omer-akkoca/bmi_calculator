import 'package:flutter/material.dart';
import "./screens/input.dart";
import "./screens/result.dart";

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff0a0e21)),
        scaffoldBackgroundColor: const Color(0xff0a0e21),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const InputPage(),
        "/result": (context) => ResultPage(bmi: "", interpretation: "", result: ""),
      },
    );
  }
}
