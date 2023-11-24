import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/utils/mixins/status_mixin.dart';
import '../../orders_module.dart';
import '../atomic/templates/orders_page_template.dart';
import '../cubits/orders_cubit.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  static const routeName = '/orders';
  static const routePath = OrdersModule.routePath + routeName;

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late final OrdersCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get<OrdersCubit>();
    _cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      bloc: _cubit,
      builder: (context, state) {
        return OrdersPageTemplate(
          orders: state.orders,
          isLoading: state.status.isLoading,
          onRefresh: _cubit.onRefresh,
        );
      },
    );
  }
}
