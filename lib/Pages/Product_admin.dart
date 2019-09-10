import 'package:flutter/material.dart';
import 'Home.dart';
import 'product_list.dart';
import 'prudct_create.dart';

class ProductAdmin extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;
  ProductAdmin(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
            title: Text("Product Admin"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "create product", icon: Icon(Icons.create)),
                Tab(text: "My product", icon: Icon(Icons.list))
              ],
            )),
        body: TabBarView(
          children: <Widget>[ProductCreate(addProduct), ProductList()],
        ),
      ),
    );
  }

  Drawer _buildSideDrawer(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("choose "),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text("All Products"),
              onTap: () {
                Navigator.pushReplacementNamed(context, "mainPage");
              },
            )
          ],
        ),
      );
  }
}
