



import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_task/core/failure/failure.dart';
import 'package:mobile_task/feauture/grocery/data_layer/model/grocery_model.dart';

abstract class RemoteAbstractSource extends Equatable {
  Future<Either<Failure, List<GroceryModel>>>getallgrocery();
  Future<Either<Failure, GroceryModel>> getgrocery(String id);
}

class RemoteSourceImpl implements RemoteAbstractSource {
  final http.Client  client;

  RemoteSourceImpl({required this.client});

  @override
  List<Object?> get props => [];

  @override     
  bool get stringify => true;

   

  @override
Future<Either<Failure, List<GroceryModel>>> getallgrocery() async {
  try {
    
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'),
      headers: {
          
          'Content-Type': 'application/json',
        },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      
      final List<dynamic> jsonList = jsonResponse['data'];

      
      final List<GroceryModel> products = jsonList
          .map((productJson) => GroceryModel.fromJson(productJson))
          .toList();

      
      return Right(products);
    } else {
      return Left(ServerFailure());
    }
  } catch (e) {
    print('Error: $e');
    return Left(NetworkFailure());
  }
}


  @override
  Future<Either<Failure, GroceryModel>> getgrocery(String id) async {
    try {
      
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries/$id',),
      headers: {
          'Content-Type': 'application/json',
        },
    );

      if (response.statusCode == 200) {
        final jsonObj = json.decode(response.body);
        final product = GroceryModel.fromJson(jsonObj);
        return Right(product);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(NetworkFailure());
    }
  }

  
}


