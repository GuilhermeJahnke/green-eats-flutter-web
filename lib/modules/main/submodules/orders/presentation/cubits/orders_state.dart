part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  const OrdersState({
    this.orders = const [],
    this.status = Status.initial,
    this.failure,
  });

  final List<Order> orders;
  final Status status;
  final Failure? failure;

  @override
  List<Object?> get props => [
        orders,
        status,
        failure,
      ];

  OrdersState copyWith({
    List<Order>? orders,
    Status? status,
    Failure? failure,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
