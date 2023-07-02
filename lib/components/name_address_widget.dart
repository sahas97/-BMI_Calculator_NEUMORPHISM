import 'package:flutter/material.dart';

import 'constants.dart';

class NameAddressWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController addressController;
  final Function(String)? onNameChanged;
  final Function(String)? onAddressChanged;

  const NameAddressWidget({
    Key? key,
    required this.nameController,
    required this.addressController,
    this.onNameChanged,
    this.onAddressChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Name TextField...
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
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
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: nameController,
              onChanged: onNameChanged,
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: kLableTextStyle,
                border: InputBorder.none,
                icon: Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        // Address TextField...
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
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
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: addressController,
              onChanged: onAddressChanged,
              decoration: InputDecoration(
                hintText: 'Address',
                hintStyle: kLableTextStyle,
                border: InputBorder.none,
                icon: Icon(
                  Icons.home,
                  size: 25,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
