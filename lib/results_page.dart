import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({ required this.bmiResult, required this.resultText, required this.interpretation});

  final String? bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Expanded(
             flex: 2,
             child: Container(
             alignment: Alignment.bottomLeft,
               padding: const EdgeInsets.all(8),
               child: const Text(
                'Your Result',
                style: kTitleTextStyle,
                textAlign: TextAlign.end,
            ),
             ),
          ),
          Expanded(
            flex: 10,
            child: CustomCard(
              colour: const Color(0xff1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText, style: kResultTextStyle,),
                  Text(bmiResult!, style: kBMITextStyle,),
                  Text(
                      interpretation,style:  kBodyTextStyle, textAlign: TextAlign.center,)

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap:() {

              Navigator.pop(context);
            },
            child: Container(
              color: kBottomContainerColor,
              margin:  EdgeInsets.only(top: scrHeight * 0.01),
              height: scrHeight * 0.09,
              width: double.infinity,
              child: const Center(
                  child: Text(
                'Re-Calculate',
                style: kLargeButtonWord,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
