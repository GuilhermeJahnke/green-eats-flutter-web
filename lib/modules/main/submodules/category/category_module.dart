import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/domain/entities/cart_manager.dart';
import '../../presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'category_navigator.dart';
import 'data/datasources/category_remote_datasource_impl.dart';
import 'data/repositories/category_repository.dart';
import 'presentation/cubits/category_cubit.dart';
import 'presentation/cubits/category_detail_cubit.dart';
import 'presentation/pages/category_detail_page.dart';
import 'presentation/pages/category_page.dart';

class CategoryModule extends Module {
  static const String routeName = '/category';
  static const routePath = WrapperNavbar.routePath + routeName;

  @override
  List<Bind<Object>> get binds => [
        // Datasources
        Bind(
          (i) => CategoryRemoteDatasourceImpl(
            loggedDio: i(),
            appNetwork: i(),
          ),
        ),

        // Repositories
        Bind(
          (i) => CategoryRepository(categoryRemoteDatasource: i()),
        ),

        // Navigator
        Bind.factory(
          (i) => CategoryNavigator(),
        ),

        // Cubits
        Bind.lazySingleton(
          (i) => CategoryCubit(
            navigator: i(),
            getCategoriesUsecase: i(),
          ),
          export: true,
        ),

        Bind.factory(
          (i) => CategoryDetailCubit(
            category: i.args.data,
            mainNavigator: i(),
            cartManager: CartManager.instance,
            getProductsByCategoryUseCase: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          CategoryModule.routePath,
          to: CategoryPage.routePath,
        ),
        ChildRoute(
          CategoryPage.routeName,
          child: (context, args) => const CategoryPage(),
        ),
        ChildRoute(
          CategoryDetailPage.routeName,
          child: (context, args) => const CategoryDetailPage(),
        ),
      ];
}
