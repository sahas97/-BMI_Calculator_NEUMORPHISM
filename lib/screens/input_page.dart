import 'package:age_calculator/age_calculator.dart';
import 'package:fitcheck_bmi_tracker/components/age_button.dart';
import 'package:fitcheck_bmi_tracker/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../components/bottom_button.dart';
import '../components/constants.dart';
import '../components/icon_content.dart';
import '../components/name_address_widget.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Name and Address variables
  String? name;
  String? address;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Color maleCardColor = kInactiveCardColor;
  Color femaleCrdColor = kInactiveCardColor;

  Gender?
      selectedGender; // ? means the variable can be null other wise it's get an exception.
  int height = 180;
  int weight = 60;
  String? gender;
  DateDuration? duration;

  void _showDatePiker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1923),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        duration = AgeCalculator.age(value!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FitCheck BMI Tracker',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 0,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                          gender = 'male';
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        lable: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                          gender = 'female';
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        lable: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: ReusableCard(
                colour: kInactiveCardColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: NameAddressWidget(
                    nameController: nameController,
                    addressController: addressController,
                    onNameChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    onAddressChanged: (value) {
                      setState(() {
                        address = value;
                      });
                    },
                  ),
                ),
                onPress: () {},
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Text(
                              'HEIGHT',
                              style: kLableTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline
                                  .alphabetic, // if error apear uncomment this line
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNumberTextStyle,
                                ),
                                const Text(
                                  'cm',
                                  style: kLableTextStyle,
                                ),
                              ],
                            ),
                            Expanded(
                              child: SfSliderTheme(
                                data: SfSliderThemeData(
                                  activeTrackColor:
                                      const Color.fromARGB(255, 130, 233, 240),
                                  inactiveTrackColor: Colors.grey.shade400,
                                  thumbColor: Colors.white,
                                  thumbRadius: 13,
                                  overlayColor:
                                      const Color.fromARGB(255, 130, 233, 240),
                                  overlayRadius: 25.0,
                                  activeLabelStyle: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  inactiveLabelStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 18,
                                  ),
                                  tickSize: const Size(20.0, 2),
                                  minorTickSize: const Size(15.0, 2),
                                  tickOffset: const Offset(25.0, 0.0),
                                ),
                                child: SfSlider.vertical(
                                  min: 120.0,
                                  max: 220.0,
                                  value: height.toDouble(),
                                  interval: 10,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic newValue) {
                                    setState(() {
                                      height = newValue.round();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPress: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            colour: kInactiveCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'AGE',
                                  style: kLableTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline
                                      .alphabetic, // if error apear uncomment this line
                                  children: [
                                    Text(
                                      duration == null
                                          ? "0"
                                          : duration!.years.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                    const Text(
                                      ' years',
                                      style: kLableTextStyle,
                                    ),
                                  ],
                                ),
                                AgeButton(
                                  icon: FontAwesomeIcons.anglesRight,
                                  onPressed: () {
                                    _showDatePiker();
                                  },
                                ),
                              ],
                            ),
                            onPress: () {},
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            colour: kInactiveCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'WEIGHT',
                                  style: kLableTextStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 25.0,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            onPress: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              if (gender == null) {
                Fluttertoast.showToast(
                    msg: "Please select gender",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: const Color.fromARGB(255, 130, 233, 240),
                    textColor: Colors.white,
                    webShowClose: true,
                    fontSize: 16.0);
              } else if (name == null || name!.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Please enter your name",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: const Color.fromARGB(255, 130, 233, 240),
                    textColor: Colors.white,
                    webShowClose: true,
                    fontSize: 16.0);
              } else if (address == null || address!.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Please enter your address",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: const Color.fromARGB(255, 130, 233, 240),
                    textColor: Colors.white,
                    webShowClose: true,
                    fontSize: 16.0);
              } else if (duration == null) {
                Fluttertoast.showToast(
                    msg: "Please enter your Age",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: const Color.fromARGB(255, 130, 233, 240),
                    textColor: Colors.white,
                    webShowClose: true,
                    fontSize: 16.0);
              } else {
                CalculatorBrain calc = CalculatorBrain(
                  height: height,
                  weight: weight,
                  name: name,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.claculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
