import "package:bmi_calculator/constants/colors.dart";
import "package:bmi_calculator/constants/styles.dart";
import "package:flutter/material.dart";
import "../components/cardContainer.dart";

class ResultPage extends StatelessWidget {
  String bmi = "";
  String result = "";
  String interpretation = "";

  ResultPage(
      {super.key,
      required this.bmi,
      required this.result,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Text(
                  "Your Result",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardContainer(
                color: kActiveCardColor,
                children: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: const TextStyle(
                          color: Color(0xff24d876),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi,
                      style: kNumberStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: const BoxDecoration(
                  color: kBottomButtonColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text(
                    "RE-CALCULATE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
