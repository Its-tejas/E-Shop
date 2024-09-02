import 'package:e_shop/Models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleFavourite(Product product){
    if(_cart.contains(product)){
      for(Product element in _cart){
        element.quantity++;
      }
    } else {
       _cart.add(product);
    }
    notifyListeners();
  }
  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) => _cart[index].quantity--;
  totalPrice(){
    double total = 0.0;
    for(Product element in _cart){
      total += element.price * element.quantity;
    }
    return total;
  }
  static CartProvider of(
      BuildContext context, {
        bool listen = true,
  }) {
    return Provider.of<CartProvider> (context, listen: listen);
  }
}