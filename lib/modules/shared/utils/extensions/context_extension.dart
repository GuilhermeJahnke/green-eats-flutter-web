import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 650;
  bool get isTablet =>
      MediaQuery.of(this).size.width >= 650 &&
      MediaQuery.of(this).size.width < 1100;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1100;
}
