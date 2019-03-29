import 'package:flutter/material.dart';
import '../widgets/products/products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';

class ProductsPage extends StatelessWidget {

  ProductsPage();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          ScopedModelDescendant(
            builder: (BuildContext context, Widget child, MainModel model){
              return IconButton(
            icon: Icon(
              model.displayFavoritesOnly ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: (){
              model.toggleDisplayMode();
            },
          );
            },
          ) 
        ],
      ),
      body: Products(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              leading: Icon(
                Icons.edit
              ),
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
