import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../main_module.dart';
import '../atomic/templates/product_detail_page_template.dart';
import '../cubits/product_detail_cubit.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  static const routeName = '/product-detail';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late final ProductDetailCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get<ProductDetailCubit>();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.product == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ProductDetailPageTemplate(
          product: state.product!,
          onAddQuantityTap: _cubit.onAddQuantityTap,
          onRemoveQuantityTap: _cubit.onRemoveQuantityTap,
          onAddCartTap: _cubit.onAddCartTap,
        );
      },
    );
  }
}
