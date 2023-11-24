import 'package:flutter/material.dart';

enum Buttontype { filled, outlined }

class ButtonMolecule extends StatefulWidget {
  const ButtonMolecule({
    super.key,
    required this.type,
    required this.title,
    this.backgroundColor,
    required this.onTap,
    this.isLoading = false,
    this.isEnabled = true,
    this.textStyle,
  });

  final Buttontype type;
  final String title;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isEnabled;
  final TextStyle? textStyle;

  @override
  State<ButtonMolecule> createState() => _ButtonMoleculeState();
}

class _ButtonMoleculeState extends State<ButtonMolecule> {
  Border? getBorder() {
    if (!widget.isEnabled) {
      return Border.all(
        color: Colors.grey,
      );
    }

    if (widget.type == Buttontype.outlined) {
      return Border.all(
        color: Colors.grey,
      );
    }

    return null;
  }

  Color? getColor() {
    if (!widget.isEnabled) {
      return Colors.grey;
    }

    if (widget.type == Buttontype.filled) {
      return widget.backgroundColor ?? Colors.green;
    }

    return null;
  }

  TextStyle getTextStyle() {
    if (widget.type == Buttontype.outlined) {
      return widget.textStyle ?? const TextStyle(color: Colors.black);
    }

    return widget.textStyle ?? const TextStyle(color: Colors.white);
  }

  Widget getWidget() {
    if (widget.isLoading) {
      return const CircularProgressIndicator(
        color: Colors.white,
      );
    }

    return Center(
      child: Text(
        widget.title,
        style: getTextStyle(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isEnabled ? widget.onTap : null,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: getBorder(),
          borderRadius: BorderRadius.circular(20),
          color: getColor(),
        ),
        child: Center(
          child: getWidget(),
        ),
      ),
    );
  }
}
