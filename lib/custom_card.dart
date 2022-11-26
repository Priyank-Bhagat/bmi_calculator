import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.colour, this.cardChild,  this.tapDetec});

  final Color colour;
  final Widget? cardChild;
  final Function()?  tapDetec;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapDetec,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        margin: const EdgeInsets.all(9),
        child: cardChild,
      ),
    );
  }
}
