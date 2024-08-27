
import 'package:mobile_task/feauture/grocery/domain_layer/entities/option_entity.dart';

class OptionModel extends OptionEntity {
  final String id;
  final String name;
  final double price;

  // Corrected constructor syntax
  OptionModel({
    required this.id,
    required this.name,
    required this.price,
  }) : super(id: id, name: name, price: price);

  // Factory constructor to create an instance from JSON
  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(), // Ensures price is a double
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  // Method to convert OptionModel to OptionEntity
  OptionEntity toEntity() {
    return OptionEntity(
      id: id,
      name: name,
      price: price,
    );
  }
}
