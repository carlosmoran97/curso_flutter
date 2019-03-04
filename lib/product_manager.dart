import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  // Named argument with default value
  ProductManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  void initState() {

    if(widget.startingProduct != null){
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    
    super.didUpdateWidget(oldWidget);
  }

  void _deleteProduct(int index){
    _products.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProductControl(_addProduct),
        Expanded(
          child: Products(_products, deleteProduct: _deleteProduct,)
        )
      ],
    );
  }
}
