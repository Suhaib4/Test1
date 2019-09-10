import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
final String address;

AddressTag(this.address);


  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(5.0)),
            child: Text(address),
          );
  }
}