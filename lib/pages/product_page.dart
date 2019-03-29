import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/ui_elements/title_default.dart';
import 'package:flutter_course/scoped-models/main.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;
  final String address = "Santa Tecla, El Salvador";
  ProductPage(this.productIndex);

  void _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action can\'t be undone!'),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) =>
            Scaffold(
              appBar: AppBar(
                title: Text('Product Details'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/img/food.jpg'),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TitleDefault(
                          model.products[productIndex].title != null
                              ? (model.products[productIndex].title)
                              : ''),
                    ),
                    _buildAddressPriceRow(),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          model.products[productIndex].description != null
                              ? model.products[productIndex].description
                              : ''),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: RaisedButton(
                        child: Text('Delete'),
                        onPressed: () => _showWarningDialog(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _buildAddressPriceRow() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  address != null ? address : '',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '|',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  model.products[productIndex].price != null ? '\$${model.products[productIndex].price.toStringAsFixed(2)}' : '',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
    );
  }
}
