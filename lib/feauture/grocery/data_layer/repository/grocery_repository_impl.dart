import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mobile_task/core/connection%20checker/connection.dart';
import 'package:mobile_task/core/failure/failure.dart';
import 'package:mobile_task/feauture/grocery/data_layer/data_source/local_data_source.dart/local_data_source_grocery.dart';
import 'package:mobile_task/feauture/grocery/data_layer/data_source/remote_data_source.dart/remote_source.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/grocery_entity.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/repository/grocery_repository.dart';

class ProductRepositoryImpl implements GroceryRepository {
  final RemoteSourceImpl remoteSource;
  final LocalDataSrc localDataSrc;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteSource,
    required this.localDataSrc,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GroceryEntity>>> getallgrocery() async {
    if (await networkInfo.isConnected()) {
      try {
        // Fetch from remote source
        final remoteResult = await remoteSource.getallgrocery();
        return remoteResult.fold(
          (failure) => Left(failure), // Return failure if remote fetch fails
          (products) async {
            // Save fetched data to local storage
            for (var product in products) {
              final productJson = json.encode(product.toJson());
              await localDataSrc.saveProduct(product.id, productJson);
            }
            return Right(products);
          },
        );
      } catch (e) {
        return Left(ServerFailure()); 
      }
    } else {
      
      final localResult = await localDataSrc.localgetAllProducts();
      return localResult;
    }
  }

  @override
  Future<Either<Failure, GroceryEntity>> getgrocery(String id) async {
    if (await networkInfo.isConnected()) {
      try {
        // Fetch from remote source
        final remoteResult = await remoteSource.getgrocery(id);
        return remoteResult.fold(
          (failure) => Left(failure), // Return failure if remote fetch fails
          (product) async {
            // Save fetched data to local storage
            final productJson = json.encode(product.toJson());
            await localDataSrc.saveProduct(product.id, productJson);
            return Right(product);
          },
        );
      } catch (e) {
        return Left(ServerFailure()); // Handle server errors
      }
    } else {
      // Fetch from local storage if no network connection
      final localResult = await localDataSrc.localgetProduct(id);
      return localResult;
    }
  }
}
