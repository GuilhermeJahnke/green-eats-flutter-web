// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'configs/constants/app_hive_box.dart';
import 'domain/entities/user.dart';

class AppInitializers {
  const AppInitializers._();

  static Future<void> init() async {
    // ignore: prefer_const_constructors
    setUrlStrategy(PathUrlStrategy());

    await Hive.initFlutter();
    Hive.registerAdapter<User>(UserAdapter());
    await Hive.openBox(HiveBoxStrings.userBoxName);
    await Hive.openBox(HiveBoxStrings.currentUserBoxName);
    await Hive.openBox(HiveBoxStrings.cookieBoxName);
  }
}
