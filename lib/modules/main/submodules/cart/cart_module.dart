import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/domain/entities/cart_manager.dart';
import '../../presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'data/datasources/cart_remote_datasource_impl.dart';
import 'data/repositories/cart_repository.dart';
import 'presentation/cubits/cart_cubit.dart';
import 'presentation/pages/cart_page.dart';

class CartModule extends Module {
  static const String routeName = '/cart';
  static const routePath = WrapperNavbar.routePath + routeName;

  @override
  List<Bind<Object>> get binds => [
        // Datasources
        Bind(
          (i) => CartRemoteDatasourceImpl(
            loggedDio: i(),
            appNetwork: i(),
          ),
          export: true,
        ),

        // Repositories
        Bind(
          (i) => CartRepository(
            remoteDatasource: i(),
          ),
          export: true,
        ),

        // Cubits
        Bind.singleton(
          (i) => CartCubit(
            cartManager: CartManager.instance,
            mainNavigator: i(),
            sendOrderUsecase: i(),
            getCurrentUserUsecase: i(),
          ),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          CartModule.routePath,
          to: CartPage.routePath,
        ),
        ChildRoute(
          CartPage.routeName,
          child: (context, args) => const CartPage(),
        ),
      ];
}
