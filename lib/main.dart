import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/product_page.dart';
import './pages/product_admin_page.dart';
import './pages/products_page.dart';

void main(){
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }

}

class _MyApp extends State<MyApp>{

  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index){
    _products.removeAt(index);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        //brightness: Brightness.dark, // apariencia oscura, como modo nocturno :)
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurpleAccent
      ),
      //home: AuthPage(),
      // no se puede tener el argument home y la ruta / al mismo tiempo
      // porque resulta reduntante
      routes: {
        '/admin': (BuildContext context) => ProductAdminPage(),
        '/':(BuildContext context) => ProductsPage(
          _products,
          _addProduct,
          _deleteProduct
        )
      },
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElements = settings.name.split('/');
        if(pathElements[0] != ''){
          return null;
        }
        if(pathElements[1] == 'product'){
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
              _products[index]['title'],
              _products[index]['imageUrl']
            )
          );
        }
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) =>
            ProductsPage(
              _products,
              _addProduct,
              _deleteProduct
            )
        );
      },
    );
  }
}
