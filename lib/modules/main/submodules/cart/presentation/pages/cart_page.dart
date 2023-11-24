import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/utils/mixins/context_mixin.dart';
import '../../../../../shared/utils/mixins/status_mixin.dart';
import '../../cart_module.dart';
import '../atomic/templates/cart_page_template.dart';
import '../cubits/cart_cubit.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static const routeName = '/cart';
  static const routePath = CartModule.routePath + routeName;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final CartCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get<CartCubit>();
    _cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.showSuccessSnackBar('Pedido enviado com sucesso!');
          _cubit.sendToOrders();
        }
        if (state.status.isFailure && state.failure != null) {
          context.showErrorSnackBar(state.failure?.exception?.message);
        }
      },
      listenWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return CartPageTemplate(
          products: state.products,
          onAddQuantityTap: _cubit.onAddQuantityTap,
          onRemoveQuantityTap: _cubit.onRemoveQuantityTap,
          onConfirmTap: _cubit.onConfirmTap,
          isLoading: state.status.isLoading,
        );
      },
    );
  }
}
