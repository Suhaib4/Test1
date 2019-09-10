import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  ProductPage(this.title, this.imageUrl, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TitleDefault(title),
            ),
            _buildAddressPriceRow(),
            Container(
                margin: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }

  Row _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Union Square, San Francisco",
            style: TextStyle(fontFamily: 'Owsald', color: Colors.grey)),
        Text(' | ', style: TextStyle(color: Colors.grey)),
        Text('\$' + price.toString(),
            style: TextStyle(fontFamily: 'Owsald', color: Colors.grey))
      ],
    );
  }
}
