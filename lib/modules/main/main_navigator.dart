import 'package:flutter_modular/flutter_modular.dart';

import '../shared/domain/entities/category.dart';
import '../shared/domain/entities/product.dart';
import 'presentation/pages/product_detail_page.dart';
import 'submodules/cart/cart_module.dart';
import 'submodules/category/category_module.dart';
import 'submodules/category/presentation/pages/category_detail_page.dart';
import 'submodules/home/home_module.dart';
import 'submodules/orders/orders_module.dart';
import 'submodules/profile/profile_module.dart';

class MainNavigator {
  void goToHome() {
    Modular.to.navigate(
      HomeModule.routePath,
    );
  }

  void goToCategory() {
    Modular.to.navigate(
      CategoryModule.routePath,
    );
  }

  void goToCart() {
    Modular.to.navigate(
      CartModule.routePath,
    );
  }

  void openProductDetailPage({required Product product}) {
    Modular.to.pushNamed(
      ProductDetailPage.routePath,
      arguments: product,
    );
  }

  void openCategoryDetailPage({required Category category}) {
    Modular.to.pushNamed(
      CategoryDetailPage.routePath,
      arguments: category,
    );
  }

  void goToProfile() {
    Modular.to.navigate(
      ProfileModule.routePath,
    );
  }

  void goToOrders() {
    Modular.to.navigate(
      OrdersModule.routePath,
    );
  }
}
