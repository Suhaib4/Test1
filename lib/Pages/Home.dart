import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import '../widgets/products/products.dart';
import '../widgets/ui_elements/title_default.dart';

class HomePage extends StatelessWidget {
  final List<Map<String,dynamic>> products;
  HomePage(this.products);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context), 
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite),onPressed: (){},)
        ],
      ),
      body: Products(products),
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
            leading: Icon(Icons.edit),
            title: Text("manage proudct"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/admin");
            },
          )
        ],
      ),
    );
  }
}
