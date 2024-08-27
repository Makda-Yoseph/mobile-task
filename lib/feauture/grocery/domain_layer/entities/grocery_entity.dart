

import 'package:equatable/equatable.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/option_entity.dart';

class GroceryEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double discount;
  final double rating;
  final List<OptionEntity >option;
  

  GroceryEntity({
      required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.discount,
      required this.rating,
      required this.option,
    });

  @override
  List<Object?> get props => [id, title, description, imageUrl, price, discount, rating, option];
}