import 'dart:convert';
import 'package:mobile_task/feauture/grocery/data_layer/model/option_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_task/feauture/grocery/data_layer/model/grocery_model.dart';
import 'package:mobile_task/feauture/grocery/data_layer/model/cart_model.dart'; // Import your CartModel

class CartLocalDataSource {
  static const String _cartKeyPrefix = 'item_'; 

  Future<void> addToCart(String id, int quantity) async {
    final prefs = await SharedPreferences.getInstance();

   
    final groceryJsonString = prefs.getString('$_cartKeyPrefix$id');
    if (groceryJsonString == null) {
      throw Exception('Grocery item not found in SharedPreferences.');
    }

    final groceryJsonMap = json.decode(groceryJsonString) as Map<String, dynamic>;
    final grocery = GroceryModel.fromJson(groceryJsonMap);

    final optionList = grocery.option.map((option) => OptionModel(
      id: option.id,
      name: option.name,
      price: option.price,
    )).toList();
    
    
    final cartItem = CartModel(
      id: grocery.id,
      title: grocery.title,
      description: grocery.description,
      imageUrl: grocery.imageUrl,
      price: grocery.price,
      discount: grocery.discount,
      rating: grocery.rating,
      quantity: quantity,
      option: optionList, 
    );


    final cartJson = json.encode(cartItem.toJson());
    await prefs.setString('$_cartKeyPrefix${cartItem.id}', cartJson);
  }

  Future<List<CartModel>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    final List<CartModel> cartItems = [];

    for (final key in keys) {
      if (key.startsWith(_cartKeyPrefix)) {
        final jsonString = prefs.getString(key);
        if (jsonString != null) {
          final Map<String, dynamic> jsonMap = json.decode(jsonString);
          final cartItem = CartModel.fromJson(jsonMap);
          cartItems.add(cartItem);
        }
      }
    }

    return cartItems;
  }

  Future<void> removeFromCart(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_cartKeyPrefix$id');
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    for (final key in keys) {
      if (key.startsWith(_cartKeyPrefix)) {
        await prefs.remove(key);
      }
    }
  }
}
