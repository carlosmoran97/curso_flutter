import 'package:flutter/material.dart';
import '../product_manager.dart';

class ProductsPage extends StatelessWidget {

  final List<Map<String, String>> _products;
  final Function _addProduct;
  final Function _deleteProduct;

  ProductsPage(this._products, this._addProduct, this._deleteProduct);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(_products, _addProduct, _deleteProduct),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Product Manager'),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/admin');
              },
            )
          ],
        ),
      ),
    );
  }
}
