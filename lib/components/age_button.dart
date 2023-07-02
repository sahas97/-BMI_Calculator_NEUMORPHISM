import 'package:flutter/material.dart';

import 'constants.dart';

class AgeButton extends StatelessWidget {
  const AgeButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 1,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
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
          elevation: 0.0,
          onPressed: onPressed,
          constraints: const BoxConstraints.tightFor(
            width: 130.0,
            height: 50.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          fillColor: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Add".toUpperCase(),
                style: kAgeButtonTextStyle,
              ),
              Icon(
                icon,
                color: Colors.grey[700],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
