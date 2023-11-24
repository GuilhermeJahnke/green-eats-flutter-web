import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/utils/mixins/status_mixin.dart';
import '../../category_module.dart';
import '../atomic/templates/category_page_template.dart';
import '../cubits/category_cubit.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  static const routeName = '/category';
  static const routePath = CategoryModule.routePath + routeName;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final CategoryCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = Modular.get<CategoryCubit>();
    _cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      bloc: _cubit,
      builder: (context, state) {
        return CategoryPageTemplate(
          categoryList: state.categories,
          onCategoryTap: _cubit.onCategoryTap,
          isLoading: state.status.isLoading,
        );
      },
    );
  }
}
