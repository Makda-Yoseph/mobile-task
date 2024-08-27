import 'package:mobile_task/feauture/grocery/data_layer/model/option_model.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
    required double price,
    required double discount,
    required double rating,
    required int quantity,
    required List<OptionModel> option,
  }) : super(
          id: id,
          title: title,
          description: description,
          imageUrl: imageUrl,
          price: price,
          discount: discount,
          rating: rating,
          quantity: quantity,
          option: option,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      quantity: json['quantity'],
      option: (json['options'] as List<dynamic>?)
        ?.map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
        .toList() ?? 
        [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'discount': discount,
      'rating': rating,
      'quantity': quantity,
      'option': (option as OptionModel).toJson(),
    };
  }
}
