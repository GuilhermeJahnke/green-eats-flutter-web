import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/order.dart';
import '../../../../../shared/domain/entities/status.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../domain/usecases/get_orders_usecase.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> with InitManager {
  OrdersCubit({
    required this.getOrdersUsecase,
  }) : super(const OrdersState());

  final GetOrdersUsecase getOrdersUsecase;

  @override
  void init() {
    _getOrders();
  }

  Future<void> _getOrders() async {
    emit(state.copyWith(status: Status.loading));

    final result = await getOrdersUsecase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: Status.failure,
            failure: failure,
          ),
        );
      },
      (orders) {
        emit(
          state.copyWith(
            status: Status.success,
            orders: orders,
          ),
        );
      },
    );
  }

  Future<void> onRefresh() async {
    await _getOrders();
  }
}
