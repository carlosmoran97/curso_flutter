import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/rendering.dart';

import './pages/product_page.dart';
import './pages/product_admin_page.dart';
import './pages/products_page.dart';
import './pages/auth_page.dart';
import 'package:flutter_course/scoped-models/main.dart';

void main() {
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

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        // debugShowMaterialGrid: true,
        theme: ThemeData(
          //brightness: Brightness.dark, // apariencia oscura, como modo nocturno :)
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: MaterialColor(0xFF00ECFD, <int, Color>{}),
        ),
        //home: AuthPage(),
        // no se puede tener el argument home y la ruta / al mismo tiempo
        // porque resulta reduntante
        routes: {
          /*
        '/':(BuildContext context) => ProductsPage(
          _products
        ),*/
          '/': (BuildContext context) => AuthPage(),
          '/home': (BuildContext context) => ProductsPage(),
          '/admin': (BuildContext context) => ProductAdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
                builder: (BuildContext context) =>
                    ProductPage(index));
          }
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage());
        },
      ),
    );
  }
}
