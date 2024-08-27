


import 'package:mobile_task/feauture/grocery/data_layer/model/cart_model.dart';

abstract class CartRepository {
  Future<void> addToCart(String id, int quantity);
  Future<List<CartModel>> getCartItems();
  Future<void> removeFromCart(String id);
  Future<void> clearCart();
}
