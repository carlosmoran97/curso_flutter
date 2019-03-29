import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './price_tag.dart';
import '../ui_elements/title_default.dart';
import '../ui_elements/address_card.dart';
import '../../models/product.dart';
import '../../scoped-models/main.dart';

class ProductCard extends StatelessWidget {
  final Product _product;
  final int _index;

  ProductCard(this._product, this._index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(_product.image),
          _buildTitlePriceRow(),
          AddressCard('Santa Tecla, El Salvador'),
          _buildButtonBar(context)
        ],
      ),
    );
  }

  Widget _buildTitlePriceRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
          padding: EdgeInsets.only(top: 10.0),
          child: TitleDefault(_product.title)),
      SizedBox(
        width: 10.0,
      ),
      PriceTag(_product.price.toStringAsFixed(2))
    ]);
  }

  Widget _buildButtonBar(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.info,
            color: Theme.of(context).primaryColor,
          ),
          iconSize: 24.0,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/${_index.toString()}'),
        ),
        ScopedModelDescendant(
          builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              icon: Icon(
                model.products[_index].isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              iconSize: 24.0,
              onPressed: () {
                model.selectProduct(_index);
                model.toggleProductFavoriteStatus();
              },
            );
          },
        )
      ],
    );
  }
}
