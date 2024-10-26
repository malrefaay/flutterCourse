
import 'package:fluttercourse/models/product.dart';

class Cart {
  List<Product> products = <Product>[];
  double _totalPrice = 0;
  int _totalProducts = 0;

  String get totalPrice {
    return  "\$ ${_totalPrice.abs().toStringAsFixed(2)}";
  }

  int get totalProducts{
    return _totalProducts;
  }

  void addToCart(Product product) {
    products.add(product);
    _totalPrice += product.price;
    _totalProducts++;
    product.count++;
  }

  void removeFromCart(Product product) {
    if (products.remove(product)) {
      _totalPrice -= product.price;
      _totalProducts--;
      product.count--;
    }
  }
}
