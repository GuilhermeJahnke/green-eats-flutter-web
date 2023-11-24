part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.products = const [],
    this.status = Status.initial,
    this.failure,
    this.user,
  });

  final List<Product> products;
  final Status status;
  final Failure? failure;
  final User? user;

  @override
  List<Object?> get props => [
        products,
        status,
        failure,
        user,
      ];

  CartState copyWith({
    List<Product>? products,
    Status? status,
    Failure? failure,
    User? user,
  }) {
    return CartState(
      products: products ?? this.products,
      status: status ?? this.status,
      failure: failure ?? this.failure,
      user: user ?? this.user,
    );
  }
}
