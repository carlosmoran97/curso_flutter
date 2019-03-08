import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  
  final Function addProduct;
  final Function editProduct;
  final Map<String, dynamic> product;

  ProductEditPage({this.addProduct, this.editProduct, this.product});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formValues = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/img/food.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child:ListView(
            padding: EdgeInsets.symmetric(
              horizontal: targetPadding / 2
            ),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: _submitForm,
              )
              // Powerful widget
              // GestureDetector(
              //   onTap: _submitForm,
              //   child: Container(
              //     color: Colors.green,
              //     child: Text(
              //       'My Button'
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      )
    );
  }

  void _submitForm() {
    if(!_formKey.currentState.validate()){
      return ;
    }
    _formKey.currentState.save();

    widget.addProduct(_formValues);

    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        icon: Icon(Icons.add_shopping_cart),
      ),
      onSaved: (String value) {
        
        _formValues['title'] = value;
        
      },
      validator: (String value){
        if(value.isEmpty){
          return 'Title is required';
        }
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.description), labelText: 'Description'),
      maxLines: 4,
      onSaved: (String value) {
        
        _formValues['description'] = value;
        
      },
      validator: (String value){
        
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration:
          InputDecoration(icon: Icon(Icons.attach_money), labelText: 'Price'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        
        _formValues['price'] = double.parse(value);
        
      },
      validator: (String value){
        if (value.isEmpty || !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number.';
        }
      },
    );
  }
}
