import 'package:flutter/material.dart';

import 'product_edit_page.dart';
import 'product_list_page.dart';

class ProductAdminPage extends StatelessWidget {
  
  ProductAdminPage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
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
          children: <Widget>[
            ProductEditPage(),
            ProductListPage()
          ],
        ),
        drawer: _buildSideDrawer(context),
      ),
    )
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
