import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/utils/mixins/status_mixin.dart';
import '../../category_module.dart';
import '../atomic/templates/category_detail_page_template.dart';
import '../cubits/category_detail_cubit.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({super.key});

  static const routeName = '/category-detail';
  static const routePath = CategoryModule.routePath + routeName;

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  late final CategoryDetailCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get<CategoryDetailCubit>();
    _cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailCubit, CategoryDetailState>(
      bloc: _cubit,
      builder: (context, state) {
        return CategoryDetailPageTemplate(
          onAddTap: _cubit.onAddTap,
          onCardTap: _cubit.onCardTap,
          productList: state.products,
          category: state.category,
          isLoading: state.status.isLoading,
        );
      },
    );
  }
}
