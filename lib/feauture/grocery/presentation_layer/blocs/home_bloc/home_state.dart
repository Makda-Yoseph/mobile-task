







  import 'package:equatable/equatable.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/grocery_entity.dart';

  abstract class ImageState extends Equatable{
    @override
    List<Object?> get props =>[];
  }

 
  class ImageLoadingState extends ImageState{}

 
class ImageLoaded extends ImageState {
  final List<GroceryEntity> items;

  ImageLoaded(this.items);
}




  class ImageLoadFailState extends ImageState{}