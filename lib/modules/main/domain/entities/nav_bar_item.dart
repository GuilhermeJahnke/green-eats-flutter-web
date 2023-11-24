import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/configs/constants/app_assets.dart';
import '../../../shared/domain/entities/cart_manager.dart';
import '../../main_navigator.dart';
import '../../submodules/cart/presentation/pages/cart_page.dart';
import '../../submodules/category/presentation/pages/category_page.dart';
import '../../submodules/home/presentation/pages/home_page.dart';
import '../../submodules/orders/presentation/pages/orders_page.dart';
import '../../submodules/profile/presentation/pages/profile_page.dart';

class NavBarItem {
  const NavBarItem({
    required this.svgPath,
    required this.route,
    required this.navigation,
    this.cartManager,
  });

  final String svgPath;
  final String route;
  final void Function() navigation;
  final CartManager? cartManager;
}

class HomeItem extends NavBarItem {
  HomeItem()
      : super(
          svgPath: AppAssets.icHome,
          route: HomePage.routePath,
          navigation: Modular.get<MainNavigator>().goToHome,
          cartManager: null,
        );
}

class CategoryItem extends NavBarItem {
  CategoryItem()
      : super(
          svgPath: AppAssets.icCategory,
          route: CategoryPage.routePath,
          navigation: Modular.get<MainNavigator>().goToCategory,
          cartManager: null,
        );
}

class CartItem extends NavBarItem {
  CartItem({
    required CartManager cartManager,
  }) : super(
          svgPath: AppAssets.icCart,
          route: CartPage.routePath,
          navigation: Modular.get<MainNavigator>().goToCart,
          cartManager: cartManager,
        );
}

class OrdersItem extends NavBarItem {
  OrdersItem()
      : super(
          svgPath: AppAssets.icOrder,
          route: OrdersPage.routePath,
          navigation: Modular.get<MainNavigator>().goToOrders,
          cartManager: null,
        );
}

class ProfileItem extends NavBarItem {
  ProfileItem()
      : super(
          svgPath: AppAssets.icPerson,
          route: ProfilePage.routePath,
          navigation: Modular.get<MainNavigator>().goToProfile,
          cartManager: null,
        );
}
