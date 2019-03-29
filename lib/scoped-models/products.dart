import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductModel extends Model{
  List<Product> _products = [];
  int _selectedProductIndex;
  bool _showFavorites = false;

  List<Product> get products{
    return List.from(_products);
  }
  List<Product> get displayedProducts{
    if(_showFavorites){
      return List.from(_products.where((Product product) => product.isFavorite).toList());
    }
    return List.from(_products);
  }

  bool get displayFavoritesOnly{
    return _showFavorites;
  }

  int get selectedProductIndex{
    return _selectedProductIndex;
  }

  Product get selectedProduct{
    Product selectedProduct = _selectedProductIndex != null 
    ? products[_selectedProductIndex]
    : null;
    return selectedProduct;
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct(Product product){
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void deleteProduct(){
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int index){
    _selectedProductIndex = index;
    notifyListeners();
  }

  void toggleProductFavoriteStatus(){
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      isFavorite: newFavoriteStatus
    );
    _products[_selectedProductIndex] =updatedProduct;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void toggleDisplayMode(){
    _showFavorites = !_showFavorites;
    notifyListeners();
  }

}