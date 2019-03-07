import 'package:flutter/material.dart';

import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  // Positional (optional) argument, with default value
  Products(this.products);

  Widget _buildProductList() {
    Widget productList;
    if (products.length > 0) {
      productList = ListView.builder(
        itemBuilder: (BuildContext context, index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productList = Center(
        child: Text('There are no products, please add some.'),
      );
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
