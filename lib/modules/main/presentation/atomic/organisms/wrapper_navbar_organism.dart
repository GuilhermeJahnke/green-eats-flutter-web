import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../main_module.dart';
import '../molecules/nav_bar_molecule.dart';

class WrapperNavbar extends StatelessWidget {
  const WrapperNavbar({super.key});

  static const routeName = '/navbar-wrapper';
  static const routePath = MainModule.routePath + routeName;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: NavbarMolecule(),
    );
  }
}
