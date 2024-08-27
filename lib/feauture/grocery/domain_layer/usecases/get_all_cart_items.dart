




import 'package:mobile_task/feauture/grocery/data_layer/model/cart_model.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/repository/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository repository;

  GetCartItemsUseCase(this.repository);

  Future<List<CartModel>> call() async {
    return await repository.getCartItems();
  }
}
