import 'package:mobile_task/feauture/grocery/data_layer/data_source/local_data_source.dart/local_data_source_cart.dart';
import 'package:mobile_task/feauture/grocery/data_layer/model/cart_model.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addToCart(String id, int quantity) async {
    try {
      await localDataSource.addToCart(id, quantity);
    } catch (e) {
      throw Exception('Failed to add item to cart: $e');
    }
  }

  @override
  Future<List<CartModel>> getCartItems() async {
    try {
      return await localDataSource.getCartItems();
    } catch (e) {
      throw Exception('Failed to get cart items: $e');
    }
  }

  @override
  Future<void> removeFromCart(String id) async {
    try {
      await localDataSource.removeFromCart(id);
    } catch (e) {
      throw Exception('Failed to remove item from cart: $e');
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      await localDataSource.clearCart();
    } catch (e) {
      throw Exception('Failed to clear cart: $e');
    }
  }
}
