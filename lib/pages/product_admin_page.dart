import 'package:flutter/material.dart';

import 'product_create_page.dart';
import 'product_list_page.dart';

class ProductAdminPage extends StatelessWidget {
  final Function _addProduct;
  final Function _deleteProduct;

  ProductAdminPage(this._addProduct, this._deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Manager'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Create Product',
                icon: Icon(Icons.create),
              ),
              Tab(
                text: 'My Products',
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[ProductCreatePage(_addProduct), ProductListPage()],
        ),
        drawer: _buildSideDrawer(context),
      ),
    );
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Product Manager'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All the products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          )
        ],
      ),
    );
  }
}
