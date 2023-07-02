import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
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
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 0.0,
        constraints: const BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: const CircleBorder(),
        fillColor: Colors.grey[300],
        child: Icon(
          icon,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
