import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/status.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../../../../shared/domain/usecases/get_categories_usecase.dart';
import '../../category_navigator.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> with InitManager {
  CategoryCubit({
    required this.navigator,
    required this.getCategoriesUsecase,
  }) : super(const CategoryState());

  final CategoryNavigator navigator;
  final GetCategoriesUsecase getCategoriesUsecase;

  @override
  void init() {
    _getCategories();
  }

  Future<void> _getCategories() async {
    emit(state.copyWith(status: Status.loading));

    final result = await getCategoriesUsecase.getCategories();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: Status.failure,
            failure: failure,
          ),
        );
      },
      (categories) {
        emit(
          state.copyWith(
            categories: categories,
            status: Status.success,
          ),
        );
      },
    );
  }

  void onCategoryTap(Category category) {
    navigator.goToCategoryDetail(
      category: category,
    );
  }
}
