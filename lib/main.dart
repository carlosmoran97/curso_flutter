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

<<<<<<< HEAD
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
=======
  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
>>>>>>> a0bc67803eff017485c4266e6cd5c358346abb78
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
<<<<<<< HEAD
        primarySwatch: const MaterialColor(0xFF001C3E, <int, Color>{
          50: const Color(0xFF001C3E),
          100: const Color(0xFF001C3E),
          200: const Color(0xFF001C3E),
          300: const Color(0xFF001C3E),
          400: const Color(0xFF001C3E),
          500: const Color(0xFF001C3E),
          600: const Color(0xFF001C3E),
          700: const Color(0xFF001C3E),
          800: const Color(0xFF001C3E),
          900: const Color(0xFF001C3E)
        }),
        accentColor: MaterialColor(0xFF00ECFD, <int, Color>{}),
=======
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurpleAccent
>>>>>>> a0bc67803eff017485c4266e6cd5c358346abb78
      ),
      //home: AuthPage(),
      // no se puede tener el argument home y la ruta / al mismo tiempo
      // porque resulta reduntante
      routes: {
<<<<<<< HEAD
        '/':(BuildContext context) => ProductsPage(
          _products
        ),
        '/admin': (BuildContext context) => ProductAdminPage(
          _addProduct,
          _deleteProduct
        ),
=======
        '/admin': (BuildContext context) => ProductAdminPage(),
        '/':(BuildContext context) => ProductsPage(
          _products,
          _addProduct,
          _deleteProduct
        )
>>>>>>> a0bc67803eff017485c4266e6cd5c358346abb78
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
<<<<<<< HEAD
              //_products[index]['imageUrl']
              'assets/img/food.jpg',
              _products[index]['description'],
              _products[index]['price']
=======
              _products[index]['imageUrl']
>>>>>>> a0bc67803eff017485c4266e6cd5c358346abb78
            )
          );
        }
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) =>
            ProductsPage(
<<<<<<< HEAD
              _products
=======
              _products,
              _addProduct,
              _deleteProduct
>>>>>>> a0bc67803eff017485c4266e6cd5c358346abb78
            )
        );
      },
    );
  }
}
