part of 'category_cubit.dart';

class CategoryState extends Equatable {
  const CategoryState({
    this.categories = const [],
    this.status = Status.initial,
    this.failure,
  });

  final List<Category> categories;
  final Status status;
  final Failure? failure;

  @override
  List<Object?> get props => [
        categories,
        status,
        failure,
      ];

  CategoryState copyWith({
    List<Category>? categories,
    Status? status,
    Failure? failure,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
