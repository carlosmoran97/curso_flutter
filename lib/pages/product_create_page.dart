import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {

  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0.00;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
        children: <Widget>[
          TextField(
            
            decoration: InputDecoration(
              labelText: 'Name',
              icon: Icon(
                Icons.add_shopping_cart
              ),
            ),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              icon: Icon(
                Icons.description
              ),
              labelText: 'Description'
            ),
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                _descriptionValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              icon: Icon(
                Icons.attach_money
              ),
              labelText: 'Price'
            ),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                _priceValue = double.parse(value);
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: (){
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'description':_descriptionValue,
                'price':_priceValue
              };

              widget.addProduct(product);

              showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text(
                      'Exit'
                    ),
                    content: Text(
                      'Product was saved succuessfuly'
                    ),
                    actions: <Widget>[
                      RaisedButton(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            _descriptionValue = '';
                            _titleValue = '';
                            _priceValue = 0.0;
                          });
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                }
              );
            },
          )
        ],
      )
    );
  }
}
