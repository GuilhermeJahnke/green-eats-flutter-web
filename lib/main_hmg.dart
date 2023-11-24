import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/shared/app_initializers.dart';
import 'modules/shared/app_module.dart';
import 'modules/shared/app_widget.dart';
import 'modules/shared/configs/env/environment_impl.dart';

Future<void> main() async {
  await AppInitializers.init();

  runApp(
    ModularApp(
      module: AppModule(HmgEnvironment()),
      child: const AppWidget(),
    ),
  );
}
