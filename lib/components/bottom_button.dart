import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
  }) : super(key: key);

  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          //padding: const EdgeInsets.only(bottom: 20.0),
          width: 100,
          height: 60.0,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 130, 233, 240),
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
          child: Center(
            child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
