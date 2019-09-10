import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;
  ProductCreate(this.addProduct);
  @override
  _ProductCreateState createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final Map<String,dynamic> _formData = {
    'title':null,'description':null,'price':null
    ,'image': 'images/default.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'product title',
      ),
      validator: (String value) {
        if (value.trim().isEmpty || value.length < 5) {
          //if (value.isEmpty){
          return 'Title is required and should be 5+ characters long.';
        }
      },
      onSaved: (String value) {

          _formData['title'] = value;
 
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'product description',
      ),
      validator: (String value) {
        if (value.trim().isEmpty || value.length < 10) {
          //if (value.isEmpty){
          return 'decoration is required and should be 10+ characters long.';
        }
      },
      maxLines: 4,
      onSaved: (String value) {
        
          _formData['decoration'] = value;
        
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'product price',
      ),
      validator: (String value) {
        if (value.trim().isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          //if (value.isEmpty){
          return 'price is required and should be a number.';
        }
      },
      keyboardType: TextInputType.number,
      onSaved: (String value) {
 
          _formData['price'] = double.parse(value);
    
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();
  
    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, 'mainPage');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('save'),
                textColor: Colors.white,
                onPressed: _submitForm,
              )
              // GestureDetector(
              //   onTap: _submitForm,
              //   child: Container(
              //   color: Colors.green,
              //   padding: EdgeInsets.all(5.0),
              //   child: Text("My Button"),
              // ),),
            ],
          ),
        ),
      ),
    );
  }
}
