import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReturnIconAtom extends StatelessWidget {
  const ReturnIconAtom({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap != null ? onTap?.call() : Modular.to.pop();
      },
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );
  }
}
