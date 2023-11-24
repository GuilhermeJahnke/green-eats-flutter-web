import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/cart_manager.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/entities/status.dart';
import '../../../../../shared/domain/entities/user.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../../../../shared/domain/usecases/get_current_user_usecase.dart';
import '../../../../main_navigator.dart';
import '../../domain/usecases/send_order_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> with InitManager {
  CartCubit({
    required this.cartManager,
    required this.mainNavigator,
    required this.sendOrderUsecase,
    required this.getCurrentUserUsecase,
  }) : super(const CartState());

  final CartManager cartManager;
  final MainNavigator mainNavigator;
  final SendOrderUsecase sendOrderUsecase;
  final GetCurrentUserUsecase getCurrentUserUsecase;

  @override
  void init() {
    cartManager.addListener(_onCartChangeListener);
    _getCurrentUser();
  }

  void _onCartChangeListener() {
    emit(
      state.copyWith(
        products: [...cartManager.products],
      ),
    );
  }

  void onRemoveQuantityTap(Product product) {
    cartManager.onRemoveQuantityTap(product);
  }

  void onAddQuantityTap(Product product) {
    cartManager.onAddQuantityTap(product);
  }

  void onConfirmTap() {
    _sendOrder();
  }

  Future<void> _getCurrentUser() async {
    final user = await getCurrentUserUsecase.getCurrentUser();

    if (user != null) {
      emit(
        state.copyWith(
          user: user,
        ),
      );
    }
  }

  Future<void> _sendOrder() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    final failureOrSuccess = await sendOrderUsecase(
      user: state.user!,
      products: state.products,
    );

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            status: Status.failure,
            failure: failure,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            status: Status.success,
          ),
        );
        cartManager.removeAllProducts();
      },
    );
  }

  void sendToOrders() {
    mainNavigator.goToOrders();
  }
}
