import 'package:flutter/material.dart';

import '../../../configs/constants/app_colors.dart';
import '../../../configs/constants/app_text_style.dart';
import '../../../configs/presentation/textFields/text_field_type_extension.dart';

enum TextFieldType { none, email, password, cpf, search }

class TextFieldMolecule extends StatefulWidget {
  const TextFieldMolecule({
    super.key,
    required this.type,
    required this.label,
    required this.onChanged,
    this.isEnabled = true,
    this.initialText,
    this.validator,
  });

  final TextFieldType type;
  final String label;
  final ValueSetter<String?> onChanged;
  final bool isEnabled;
  final String? initialText;
  final String? Function(String?)? validator;

  @override
  State<TextFieldMolecule> createState() => _TextFieldMoleculeState();
}

class _TextFieldMoleculeState extends State<TextFieldMolecule> {
  bool isObscure = false;
  String? errorText;

  Widget? getSuffixIcon() {
    if (widget.type == TextFieldType.password) {
      return InkWell(
        onTap: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        child: Icon(
          isObscure ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
        ),
      );
    }

    return null;
  }

  Widget? getPrefixIcon() {
    if (widget.type == TextFieldType.search) {
      return const Icon(
        Icons.search,
        color: AppColors.primaryColor,
      );
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    if (widget.type == TextFieldType.password) {
      isObscure = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObscure,
      enabled: widget.isEnabled,
      onChanged: (value) {
        widget.onChanged(value);

        if (widget.type.getValidator().validate(value) == null) {
          if (errorText != null) {
            setState(() {
              errorText = null;
            });
          }

          return;
        }

        setState(() {
          errorText = widget.type.getValidator().validate(value);
        });
      },
      validator: widget.validator?.call,
      initialValue: widget.initialText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        labelStyle: AppTextStyle.bodyRegular,
        labelText: widget.label,
        errorText: errorText,
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        prefixIcon: getPrefixIcon(),
        suffixIcon: getSuffixIcon(),
      ),
    );
  }
}
