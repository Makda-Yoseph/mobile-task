
import 'package:mobile_task/feauture/grocery/domain_layer/repository/cart_repository.dart';

class RemoveFromCartUseCase {
  final CartRepository repository;

  RemoveFromCartUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.removeFromCart(id);
  }
}
