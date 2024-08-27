



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/usecases/get_all_grocery.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/blocs/home_bloc/home_event.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/blocs/home_bloc/home_state.dart';

class HomeBloc extends Bloc<ImageEvent, ImageState> {
  final GetAllGrocery getallgrocery;

  HomeBloc({required this.getallgrocery}) : super(ImageLoadingState()) {
    on<ImageFetch>(_onImageFetch);
    // on<SearchProductsEvent>(_onSearchProducts);
  }

  Future<void> _onImageFetch(
    ImageFetch event,
    Emitter<ImageState> emit,
  ) async {
    emit(ImageLoadingState());

    final result = await getallgrocery.execute();
    // print(result);

    result.fold(
      (failure) {
        emit(ImageLoadFailState());
      },
      (products) {
        emit(ImageLoaded(products));
      },
    );
  }

//   Future<void> _onSearchProducts(
//   SearchProductsEvent event,
//   Emitter<ImageState> emit,
// ) async {
//   emit(ImageLoadingState());

//   final result = await getallgrocery.execute();

//   result.fold(
//     (failure) {
//       emit(ImageLoadFailState());
//     },
//     (products) {
//       if (event.query.trim().isEmpty) {
//         emit(ImageLoaded(products));
//       } else {
//         final filteredProducts = products.where((product) =>
//           GroceryEntity.title.trim().toLowerCase().contains(event.query.trim().toLowerCase())).toList();

//         if (filteredProducts.isEmpty) {
//           emit(ImageLoadFailState());
//         } else {
//           emit(ImageLoaded(filteredProducts));
//         }
//       }
//     },
//   );
// }

}
