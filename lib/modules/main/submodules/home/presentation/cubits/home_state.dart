part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.categoriesFailure,
    this.productsFailure,
    this.discountProductsFailure,
    this.categories = const [],
    this.products = const [],
    this.discountProducts = const [],
    this.user,
    this.discountProductsStatus = Status.initial,
    this.categoriesStatus = Status.initial,
    this.productsStatus = Status.initial,
  });

  final Failure? categoriesFailure;
  final Failure? productsFailure;
  final Failure? discountProductsFailure;
  final List<Category> categories;
  final List<Product> products;
  final List<Product> discountProducts;
  final User? user;
  final Status discountProductsStatus;
  final Status categoriesStatus;
  final Status productsStatus;

  @override
  List<Object?> get props => [
        categoriesFailure,
        productsFailure,
        discountProductsFailure,
        categories,
        products,
        discountProducts,
        user,
        discountProductsStatus,
        categoriesStatus,
        productsStatus,
      ];

  HomeState copyWith({
    Failure? categoriesFailure,
    Failure? productsFailure,
    Failure? discountProductsFailure,
    List<Category>? categories,
    List<Product>? products,
    List<Product>? discountProducts,
    User? user,
    Status? discountProductsStatus,
    Status? categoriesStatus,
    Status? productsStatus,
  }) {
    return HomeState(
      categoriesFailure: categoriesFailure ?? this.categoriesFailure,
      productsFailure: productsFailure ?? this.productsFailure,
      discountProductsFailure:
          discountProductsFailure ?? this.discountProductsFailure,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      discountProducts: discountProducts ?? this.discountProducts,
      user: user ?? this.user,
      discountProductsStatus:
          discountProductsStatus ?? this.discountProductsStatus,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      productsStatus: productsStatus ?? this.productsStatus,
    );
  }
}
