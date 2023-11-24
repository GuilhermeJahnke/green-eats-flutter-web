import 'package:flutter/material.dart';

mixin InitManager {
  bool _isInitialized = false;

  @mustCallSuper
  void onInit() {
    if (!_isInitialized) {
      init();
    }
    _isInitialized = true;
  }

  void init();

  @mustCallSuper
  void reset() {
    _isInitialized = false;
    onInit();
  }
}
