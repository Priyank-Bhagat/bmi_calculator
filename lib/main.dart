import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0A0E21),
        appBarTheme: const AppBarTheme(
          color: Color(0xff0A0E21),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.purpleAccent),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      home: const InputPage(),
    );
  }
}
