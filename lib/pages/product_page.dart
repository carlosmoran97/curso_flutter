import 'dart:async';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget{
  
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl, this.description, this.price);
  
  void _showWarningDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('This action can\'t be undone!'),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      }, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title != null ? title : ''
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description != null ? description : ''
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                price != null ? 'Precio: $price' : ''
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
                child: RaisedButton(
                  child: Text('Delete'),
                  onPressed: () => _showWarningDialog(context),
              ),
            )
          ],
        )
      )
    );
  }

}
