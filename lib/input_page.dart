import 'package:bmi_calc/bmi_brain.dart';
import 'package:bmi_calc/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'custom_card.dart';
import 'card_content_col.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected = Gender.male;
  int height = 160;
  int weight = 65;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomCard(
                    tapDetec: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    cardChild: const CardContentCol(
                      icon: FontAwesomeIcons.mars,
                      title: 'Male',
                    ),
                    colour: genderSelected == Gender.male
                        ? kCardSelectedColor
                        : kCardNotSelectedColor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomCard(
                    tapDetec: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    cardChild: const CardContentCol(
                        title: 'Female', icon: FontAwesomeIcons.venus),
                    colour: genderSelected == Gender.female
                        ? kCardSelectedColor
                        : kCardNotSelectedColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomCard(
              colour: kCardSelectedColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: kTextStyleWord,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kTextStyleNum,
                      ),
                      const Text(
                        'cm',
                        style: kTextStyleWord,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xff8D8E98),
                      thumbColor: const Color(0xffEb1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 110,
                      max: 220,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: kTextStyleWord,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyleNum,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: const Icon(Icons.remove),
                              ontap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: scrWidth * 0.04,
                            ),
                            RoundIconButton(
                              icon: const Icon(Icons.add),
                              ontap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kCardSelectedColor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: kTextStyleWord,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyleNum,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: const Icon(Icons.remove),
                              ontap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: scrWidth * 0.04,
                            ),
                            RoundIconButton(
                              icon: const Icon(Icons.add),
                              ontap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kCardSelectedColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiBrain calc = BmiBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  interpretation: calc.getInterpretation(),
                  resultText: calc.getResult(),
                );
              }));
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: scrHeight * 0.01),
              height: scrHeight * 0.09,
              width: double.infinity,
              child: const Center(
                  child: Text(
                'Calculate',
                style: kLargeButtonWord,
              )),
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
   RoundIconButton({required this.icon, required this.ontap});

  final Widget icon;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;

    return RawMaterialButton(
      onPressed: ontap,
      fillColor: const Color(0xff4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: scrWidth * 0.1,
        height: scrWidth * 0.1,
      ),
      elevation: 6,
      shape: const CircleBorder(),
      child: icon,
    );
  }
}
