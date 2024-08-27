


import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class ImageFetch extends ImageEvent {}
class SearchProductsEvent extends ImageEvent {
  final String query;

  SearchProductsEvent(this.query);
}
