import 'package:flutter/material.dart';

import './product_edit_page.dart';

class ProductListPage extends StatelessWidget{

  final List<Map<String, dynamic>> _products;

  ProductListPage(this._products);

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) 
        => ListTile(
          leading: Container(
            height: 64.0,
            width: 64.0,
            child: Image.asset(_products[index]['image'])
          ),
          title: Text(_products[index]['title']),
          trailing: IconButton(
            icon: Icon(
              Icons.edit
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context){
                  return ProductEditPage(
                    product: _products[index],
                  );
                }
              ));
            },
          )
        ),
      itemCount: _products.length,
    );
  }


}