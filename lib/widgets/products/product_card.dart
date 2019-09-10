import 'package:flutter/material.dart';
import './price_tag.dart';
import '../ui_elements/title_default.dart';
import 'address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          _buildTitlePriceRow(),
          AddressTag("Union Square, San Francisco"),
          _buildActionButtons(context)
        ],
      ),
    );
  }

  ButtonBar _buildActionButtons(BuildContext context) {
    return ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              color: Theme.of(context).accentColor,
              onPressed: () => Navigator.pushNamed<bool>(
                  context, '/product/$productIndex'),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.red),
              onPressed: () {},
            ),
          ],
        );
  }

  Container _buildTitlePriceRow() {
    return Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleDefault(product["title"]),
              SizedBox(
                width: 20.0,
              ),
              priceTag(product['price'].toString())
            ],
          ),
        );
  }
}
