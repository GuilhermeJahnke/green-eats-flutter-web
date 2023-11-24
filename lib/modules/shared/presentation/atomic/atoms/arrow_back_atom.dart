import 'package:flutter/material.dart';

class ArrowBackAtom extends StatelessWidget {
  const ArrowBackAtom({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? Navigator.of(context).pop,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
    );
  }
}
