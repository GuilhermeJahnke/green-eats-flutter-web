import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/domain/entities/category.dart';
import 'presentation/pages/category_detail_page.dart';

class CategoryNavigator {
  void goToCategoryDetail({required Category category}) {
    Modular.to.pushNamed(
      CategoryDetailPage.routePath,
      arguments: category,
    );
  }
}
