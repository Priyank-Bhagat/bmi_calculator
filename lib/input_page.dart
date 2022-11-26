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
                      print('male selected');
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
                      print('female selected');
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    cardChild: CardContentCol(
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
                      inactiveTrackColor: Color(0xff8D8E98),
                      thumbColor: Color(0xffEb1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                          print(height);
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
                        Text(
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
                            RoundIconButton(icon: Icon(Icons.remove), ontap: (){setState(() {
                              weight --;
                            });},),
                            SizedBox(
                              width: 6,
                            ),
                            RoundIconButton(icon: Icon(Icons.add),
                            ontap: (){
                              setState(() {
                                weight ++;
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
                        Text(
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
                            RoundIconButton(icon: Icon(Icons.remove), ontap: (){setState(() {
                              age --;
                            });},),
                            SizedBox(
                              width: 6,
                            ),
                            RoundIconButton(icon: Icon(Icons.add),
                              ontap: (){
                                setState(() {
                                  age ++;
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
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            height: 40,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon,required this.ontap});

  final Widget icon;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: ontap,
      child: icon,
      fillColor: Color(0xff4C4F5E),
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      elevation: 6,
      shape: CircleBorder(),
    );
  }
}
