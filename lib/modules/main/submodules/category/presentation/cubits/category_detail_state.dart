part of 'category_detail_cubit.dart';

class CategoryDetailState extends Equatable {
  const CategoryDetailState({
    this.products = const [],
    this.category,
    this.status = Status.initial,
    this.failure,
  });

  final List<Product> products;
  final Category? category;
  final Status status;
  final Failure? failure;

  @override
  List<Object?> get props => [
        products,
        category,
        status,
        failure,
      ];

  CategoryDetailState copyWith({
    List<Product>? products,
    Category? category,
    Status? status,
    Failure? failure,
  }) {
    return CategoryDetailState(
      products: products ?? this.products,
      category: category ?? this.category,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
