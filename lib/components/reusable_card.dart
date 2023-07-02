import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    required this.colour,
    required this.cardChild,
    required this.onPress,
  }) : super(key: key);

  final Color colour;
  final Widget cardChild;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 7,
              spreadRadius: 1,
            ),
          ],
        ),
        child: cardChild,
      ),
    );
  }
}

// width: 200.0,
// height: 170.0,