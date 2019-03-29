import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../scoped-models/main.dart';

class ProductEditPage extends StatefulWidget {
  ProductEditPage();

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
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Widget pageContent =
            _buildPageContent(context, model.selectedProduct);
        return model.selectedProductIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit product'),
                ),
                body: pageContent,
              );
      },
    );
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return RaisedButton(
          child: Text('Save'),
          onPressed: () => _submitForm(model.addProduct, model.updateProduct, model.selectedProductIndex),
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context, Product product) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
              children: <Widget>[
                _buildTitleTextField(product),
                _buildDescriptionTextField(product),
                _buildPriceTextField(product),
                SizedBox(
                  height: 10.0,
                ),
                _buildSubmitButton(),
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
        ));
  }

  void _submitForm(Function addProduct, Function updateProduct, [int selectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Product product = Product(
        title: _formValues['title'],
        description: _formValues['description'],
        price: _formValues['price'],
        image: _formValues['image']);

    if (selectedProductIndex != null) {
      updateProduct(product);
    } else {
      addProduct(product);
    }
    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _buildTitleTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        icon: Icon(Icons.add_shopping_cart),
      ),
      initialValue: product == null ? '' : product.title,
      onSaved: (String value) {
        _formValues['title'] = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is required';
        }
      },
    );
  }

  Widget _buildDescriptionTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.description), labelText: 'Description'),
      initialValue: product == null ? '' : product.description,
      maxLines: 4,
      onSaved: (String value) {
        _formValues['description'] = value;
      },
      validator: (String value) {},
    );
  }

  Widget _buildPriceTextField(Product product) {
    return TextFormField(
      decoration:
          InputDecoration(icon: Icon(Icons.attach_money), labelText: 'Price'),
      initialValue:
          product == null ? '' : product.price.toString(),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formValues['price'] = double.parse(value);
      },
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number.';
        }
      },
    );
  }
}
