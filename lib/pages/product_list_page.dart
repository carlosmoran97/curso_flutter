import 'package:flutter/material.dart';

import './product_edit_page.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/products.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder:(BuildContext context, Widget child, ProductModel model){ return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            color: Colors.red,
          ),
          key: Key(model.products[index].title),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.startToEnd) {
              model.selectProduct(index);
              model.deleteProduct();
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(model.products[index].image),
                ),
                title: Text(
                  model.products[index].title,
                ),
                subtitle:
                    Text('\$ ${model.products[index].price.toStringAsFixed(2)}'),
                trailing: _buildEditButton(context, index, model),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: model.products.length,
    );}
    ); 
  }

  Widget _buildEditButton(BuildContext context, int index, ProductModel model) {
    return IconButton(
      icon: Icon(
        Icons.edit,
      ),
      onPressed: () {
        model.selectProduct(index);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage();
            },
          ),
        );
      },
    );
  }
}
