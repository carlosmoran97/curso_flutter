import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './product_card.dart';
import '../../models/product.dart';
import 'package:flutter_course/scoped-models/main.dart';

class Products extends StatelessWidget {
  Products();

  Widget _buildProductList(List<Product> products) {
    Widget productList;
    if (products.length > 0) {
      productList = ListView.builder(
        itemBuilder: (BuildContext context, index) =>
            ProductCard(products[index], index),
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
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildProductList(model.displayedProducts);
      },
    );
  }
}
