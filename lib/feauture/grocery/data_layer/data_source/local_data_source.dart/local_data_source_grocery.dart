









import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_task/core/failure/failure.dart';
import 'package:mobile_task/feauture/grocery/data_layer/model/grocery_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSourceGroceryAbstract extends Equatable{

  
  Future<Either<Failure, List<GroceryModel>>> localgetAllProducts();
  Future<Either<Failure, GroceryModel>> localgetProduct(String id);
  Future<Either<Failure, void>> saveProduct(String id, String productJson);


}

class LocalDataSrc implements LocalDataSourceGroceryAbstract
{
 
  @override
  List<Object?> get props => [];

   @override
  bool get stringify => true; 

  @override
  Future<Either<Failure, GroceryModel>> localgetProduct(String id)async {
     try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(id);

    if (jsonString != null) {
      
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      GroceryModel product = GroceryModel.fromJson(jsonMap);
      return Right(product);
    } else {
      
      return Left(ProductNotFoundError());
    }
  } catch (e) {
    
    return Left(CachingError());
  }
}

 
  
  @override
  Future<Either<Failure, List<GroceryModel>>> localgetAllProducts() async{
     try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();

    if (keys.isNotEmpty) {
      List<GroceryModel> products = [];

      for (String key in keys) {
        String? jsonString = prefs.getString(key);
        if (jsonString != null) {
          products.add(GroceryModel.fromJson(jsonDecode(jsonString)));
        }
      }

      return Right(products);
    } else {
      return Left(CachingError()); 
    }
  } catch (e) {
      return Left(CachingError());
    }
  }

   @override
  Future<Either<Failure, void>> saveProduct(String id, String productJson) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(id, productJson);
      return Right(null); // Success
    } catch (e) {
      return Left(CachingError());
    }
  }
 
}






     