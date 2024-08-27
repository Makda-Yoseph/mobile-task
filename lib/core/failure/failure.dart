
// import 'package:equatable/equatable.dart';

// abstract class Failure extends Equatable{
//   Failure([List properties = const <dynamic>[]]);
// }

abstract class Failure {
  // Base class for failures
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure([this.message = 'Server error occurred']);
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure([this.message = 'Network error occurred']);
}
class CachingError extends Failure {
  final String message;

  CachingError([this.message = 'catching error occurred']);
}
class ProductNotFoundError  extends Failure {
  final String message;

  ProductNotFoundError([this.message = 'item you are looking is not found']);
}

