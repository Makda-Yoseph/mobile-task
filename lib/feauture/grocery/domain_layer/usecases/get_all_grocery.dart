




import 'package:dartz/dartz.dart';
import 'package:mobile_task/core/failure/failure.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/grocery_entity.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/repository/grocery_repository.dart';

class GetAllGrocery{
  final GroceryRepository groceryRepository;
  GetAllGrocery(this.groceryRepository);
  Future<Either<Failure,List<GroceryEntity> >>execute( ){
    return groceryRepository.getallgrocery();
  }

}