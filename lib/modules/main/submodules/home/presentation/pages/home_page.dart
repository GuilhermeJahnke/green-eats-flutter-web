import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/utils/mixins/context_mixin.dart';
import '../../../../../shared/utils/mixins/status_mixin.dart';
import '../../home_module.dart';
import '../atomic/templates/home_page_template.dart';
import '../cubits/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';
  static const routePath = HomeModule.routePath + routeName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = Modular.get<HomeCubit>();
    _cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _cubit,
      builder: (context, state) {
        return HomePageTemplate(
          onSearchChanged: _cubit.onSearchChanged,
          onDiscountCardTap: _cubit.onDiscountCardTap,
          onCategoryTap: _cubit.onCategoryTap,
          onAddTap: (product) {
            _cubit.onAddTap(product);
            context.showSuccessAddCartSnackBar();
          },
          onCardTap: _cubit.onCardTap,
          onSeeMoreCategoryTap: _cubit.onSeeMoreCategoryTap,
          discountProducts: state.discountProducts,
          categories: state.categories,
          products: state.products,
          user: state.user,
          discountProductsIsLoading: state.discountProductsStatus.isLoading,
          categoriesIsLoading: state.categoriesStatus.isLoading,
          productsIsLoading: state.productsStatus.isLoading,
        );
      },
    );
  }
}
