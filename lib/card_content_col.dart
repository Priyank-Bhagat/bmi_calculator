import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';


class CardContentCol extends StatelessWidget {
  const CardContentCol({required this.title,required this.icon});


  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        FaIcon(
          icon,
          size: 60,
        ),
        const SizedBox(height: 15,),
        Text(title,style: kTextStyleWord,),
      ],
    );
  }
}
