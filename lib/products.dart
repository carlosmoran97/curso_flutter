import 'package:flutter/material.dart';


class Products extends StatelessWidget {

  final List<Map<String, String>> products;
  final Function deleteProduct;
  // Positional (optional) argument, with default value
  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['imageUrl']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(
                  context, 
                  '/product/${index.toString()}'
                ).then((bool value){
                  if(value){
                    deleteProduct(index);
                  }
                }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productList;
    if (products.length > 0) {
      productList = ListView.builder(
        itemBuilder: _buildProductItem,
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
