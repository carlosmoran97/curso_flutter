import 'package:flutter/material.dart';
import '../product_manager.dart';

class ProductsPage extends StatelessWidget {

<<<<<<< HEAD
  final List<Map<String, dynamic>> _products;

  ProductsPage(this._products);
=======
  final List<Map<String, String>> _products;
  final Function _addProduct;
  final Function _deleteProduct;

  ProductsPage(this._products, this._addProduct, this._deleteProduct);
>>>>>>> a0bc67803eff017485c4266e6cd5c358346abb78

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
      ),
<<<<<<< HEAD
      body: ProductManager(_products),
=======
      body: ProductManager(_products, _addProduct, _deleteProduct),
>>>>>>> a0bc67803eff017485c4266e6cd5c358346abb78
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
