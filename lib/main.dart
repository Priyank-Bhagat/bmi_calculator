import 'package:flutter/material.dart';

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

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      floatingActionButton: Theme(
        data: ThemeData(
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      body: const Center(
        child: Text('BODY'),
      ),
    );
  }
}
