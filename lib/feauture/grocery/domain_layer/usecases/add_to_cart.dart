
import 'package:mobile_task/feauture/grocery/domain_layer/repository/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<void> call(String id, int quantity) async {
    await repository.addToCart(id, quantity);
  }
}
