import 'package:bmi_calculator/bmiBrain.dart';
import 'package:bmi_calculator/components/circularIconButton.dart';
import 'package:bmi_calculator/constants/styles.dart';
import 'package:bmi_calculator/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "../components/cardContainer.dart";
import "../components/iconCard.dart";
import '../constants/colors.dart';
import '../constants/enums.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 25;

  void changeGender({required Gender gender}) {
    setState(() {
      this.gender = gender;
    });
  }

  void decreaseWeight() {
    if (weight > 0) {
      setState(() {
        weight--;
      });
    } else {
      setState(() {
        weight = 0;
      });
    }
  }

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  void decreaseAge() {
    if (weight > 0) {
      setState(() {
        age--;
      });
    } else {
      setState(() {
        age = 0;
      });
    }
  }

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      onPressed: () => changeGender(gender: Gender.male),
                      color: gender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      children: const IconCard(
                        title: "MALE",
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      onPressed: () => changeGender(gender: Gender.female),
                      color: gender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      children: const IconCard(
                        title: "FEMALE",
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardContainer(
                color: const Color(0xff1d1e33),
                children: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: kTitleStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("$height", style: kNumberStyle),
                        const Text(
                          "cm",
                          style: TextStyle(fontSize: 18, color: kTitleColor),
                        )
                      ],
                    ),
                    SliderTheme(
                        data: const SliderThemeData(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kTitleColor,
                            thumbColor: kBottomButtonColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            overlayColor: kOpacityTitleColor),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (e) {
                            setState(() {
                              height = e.round();
                            });
                          },
                          min: 100.0,
                          max: 250.0,
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      color: kActiveCardColor,
                      children: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("WEIGHT", style: kTitleStyle),
                          Text("$weight", style: kNumberStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: decreaseWeight,
                              ),
                              const SizedBox(width: 15),
                              CircularIconButton(
                                  icon: Icons.add, onPressed: increaseWeight),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      color: kActiveCardColor,
                      children: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("AGE", style: kTitleStyle),
                          Text("$age", style: kNumberStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: decreaseAge,
                              ),
                              const SizedBox(width: 15),
                              CircularIconButton(
                                icon: Icons.add,
                                onPressed: increaseAge,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                BmiBrain bmi = BmiBrain(weight: weight, height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: bmi.calculateBMI(),
                      interpretation: bmi.getInterpretation(),
                      result: bmi.getResult(),
                    ),
                  ),
                );
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
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
