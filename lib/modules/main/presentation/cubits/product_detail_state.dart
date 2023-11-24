part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.product,
  });

  final Product? product;

  ProductDetailState copyWith({
    Product? product,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [product];
}
