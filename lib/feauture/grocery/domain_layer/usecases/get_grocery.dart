



import 'package:dartz/dartz.dart';
import 'package:mobile_task/core/failure/failure.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/grocery_entity.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/repository/grocery_repository.dart';

class GetGrocery{
  GroceryRepository groceryRepository;
  GetGrocery(this.groceryRepository);
  Future<Either<Failure,GroceryEntity >>execute(String id){
    return groceryRepository.getgrocery(id);
  }
}