import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/domain/entities/cart_manager.dart';
import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/entities/status.dart';
import '../../../../../shared/domain/entities/user.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../../../../shared/domain/usecases/get_categories_usecase.dart';
import '../../../../../shared/domain/usecases/get_current_user_usecase.dart';
import '../../../../../shared/domain/usecases/get_products_usecase.dart';
import '../../../../main_navigator.dart';
import '../../../cart/presentation/cubits/cart_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with InitManager {
  HomeCubit({
    required this.mainNavigator,
    required this.cartManager,
    required this.getCurrentUsecase,
    required this.getCategoriesUsecase,
    required this.getProductsUsecase,
  }) : super(const HomeState());

  final MainNavigator mainNavigator;
  final CartManager cartManager;
  final CartCubit cartCubit = Modular.get<CartCubit>();
  final GetCurrentUserUsecase getCurrentUsecase;
  final GetCategoriesUsecase getCategoriesUsecase;
  final GetProductsUsecase getProductsUsecase;

  @override
  void init() {
    cartCubit.init();

    Future.wait([
      _getCurrentUser(),
      _getCategories(),
      _getProducts(),
    ]);
  }

  void onCardTap(Product value) {
    mainNavigator.openProductDetailPage(
      product: value,
    );
  }

  void onAddTap(Product product) {
    cartManager.addProduct(product);
  }

  void onSearchChanged(String? value) {}

  void onDiscountCardTap(Product product) {
    mainNavigator.openProductDetailPage(
      product: product,
    );
  }

  void onCategoryTap(Category value) {
    mainNavigator.openCategoryDetailPage(
      category: value,
    );
  }

  void onSeeMoreCategoryTap() {
    mainNavigator.goToCategory();
  }

  Future<void> _getCurrentUser() async {
    final user = await getCurrentUsecase.getCurrentUser();

    emit(
      state.copyWith(
        user: user,
      ),
    );
  }

  Future<void> _getCategories() async {
    emit(state.copyWith(categoriesStatus: Status.loading));

    final result = await getCategoriesUsecase.getCategories();

    result.fold(
      (failure) => emit(
        state.copyWith(
          categoriesStatus: Status.failure,
          categoriesFailure: failure,
        ),
      ),
      (categories) => emit(
        state.copyWith(
          categories: categories,
          categoriesStatus: Status.success,
        ),
      ),
    );
  }

  Future<void> _getProducts() async {
    emit(state.copyWith(productsStatus: Status.loading));

    final result = await getProductsUsecase.getProducts();

    result.fold(
      (failure) => emit(
        state.copyWith(
          productsStatus: Status.failure,
          productsFailure: failure,
        ),
      ),
      (products) => emit(
        state.copyWith(
          products: products,
          discountProducts: products
              .where((product) => product.discount > 0)
              .toList()
              .take(3)
              .toList(),
          productsStatus: Status.success,
        ),
      ),
    );
  }
}
