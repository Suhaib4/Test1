import 'package:flutter/material.dart';

class priceTag extends StatelessWidget {
  final String price;
  priceTag(this.price);
  @override
  Widget build(BuildContext context) {
     return Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                  child: Text(
                    '\$$price',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5.0)),
                );
  }
}