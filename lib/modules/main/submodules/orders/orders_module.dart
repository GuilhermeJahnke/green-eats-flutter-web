import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'data/datasources/orders_remote_datasource_impl.dart';
import 'data/repositories/orders_repositories.dart';
import 'presentation/cubits/orders_cubit.dart';
import 'presentation/pages/orders_page.dart';

class OrdersModule extends Module {
  static const String routeName = '/orders';
  static const routePath = WrapperNavbar.routePath + routeName;

  @override
  List<Bind<Object>> get binds => [
        // Datasources
        Bind(
          (i) => OrdersRemoteDatasourceImpl(
            loggedDio: i(),
            appNetwork: i(),
          ),
        ),

        // Repositories
        Bind((i) => OrdersRepositories(ordersRemoteDatasource: i())),

        // Cubits
        Bind(
          (i) => OrdersCubit(
            getOrdersUsecase: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          OrdersModule.routePath,
          to: OrdersPage.routePath,
        ),
        ChildRoute(
          OrdersPage.routeName,
          child: (context, args) => const OrdersPage(),
        ),
      ];
}
