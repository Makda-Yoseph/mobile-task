
import 'package:mobile_task/feauture/grocery/data_layer/model/option_model.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/grocery_entity.dart';

class GroceryModel extends GroceryEntity {
  GroceryModel({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
    required double price,
    required double discount,
    required double rating,
    required List<OptionModel> option,
  }) : super(
          id: id,
          title: title,
          description: description,
          imageUrl: imageUrl,
          price: price,
          discount: discount,
          rating: rating,
          option: option,
        );

  
  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
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
      'option': option.map((e) => (e as OptionModel).toJson()).toList(),
    };
  }

  
  GroceryEntity toEntity() {
    return GroceryEntity(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      price: price,
      discount: discount,
      rating: rating,
      option: option,
    );
  }
}
