
import 'package:dartz/dartz.dart';
import 'package:mobile_task/core/failure/failure.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/grocery_entity.dart';

abstract class GroceryRepository{
  Future<Either<Failure,List<GroceryEntity>>>getallgrocery();

   Future<Either<Failure,GroceryEntity>>getgrocery(String id);

}