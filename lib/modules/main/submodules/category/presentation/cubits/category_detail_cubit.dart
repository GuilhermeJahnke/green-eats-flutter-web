import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/cart_manager.dart';
import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/entities/status.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../../../main_navigator.dart';
import '../../domain/usecases/get_products_by_category_usecase.dart';

part 'category_detail_state.dart';

class CategoryDetailCubit extends Cubit<CategoryDetailState> {
  CategoryDetailCubit({
    required this.category,
    required this.mainNavigator,
    required this.cartManager,
    required this.getProductsByCategoryUseCase,
  }) : super(
          const CategoryDetailState(),
        );

  final Category category;
  final MainNavigator mainNavigator;
  final CartManager cartManager;
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;

  void onInit() {
    emit(
      state.copyWith(
        category: category,
      ),
    );
    _getProducts();
  }

  Future<void> _getProducts() async {
    emit(state.copyWith(status: Status.loading));

    final result = await getProductsByCategoryUseCase(category.id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: Status.failure,
            failure: failure,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            products: products,
            status: Status.success,
          ),
        );
      },
    );
  }

  void onCardTap(Product value) {
    mainNavigator.openProductDetailPage(
      product: value,
    );
  }

  void onAddTap(Product value) {
    cartManager.addProduct(value);
  }
}
