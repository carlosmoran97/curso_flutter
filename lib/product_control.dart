import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {

  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: RaisedButton(
        child: Text('Add Product'),
        onPressed: () {
          addProduct('Sweets');
        },
      ),
      margin: EdgeInsets.all(10.0),
    );
  }
}
