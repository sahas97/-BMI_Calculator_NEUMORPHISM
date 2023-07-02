import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.icon, required this.lable})
      : super(key: key);

  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40.0,
            color: Colors.grey[700],
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            lable,
            style: kLableTextStyle,
          ),
        ],
      ),
    );
  }
}
