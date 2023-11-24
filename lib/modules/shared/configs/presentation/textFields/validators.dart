import '../../../utils/utils.dart';

abstract class TextFieldValidator {
  String? validate(String? value);
}

class EmptyValidator implements TextFieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}

class PasswordValidator implements TextFieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (value.length < 6) {
      return 'Senha deve ter no mínimo 6 caracteres';
    }

    return null;
  }
}

class EmailValidator implements TextFieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty || !Utils.isEmailValid(value)) {
      return 'Email inválido';
    }

    return null;
  }
}

class CpfValidator implements TextFieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!Utils.isCpfValid(value)) {
      return 'CPF inválido';
    }

    return null;
  }
}

class SearchValidator implements TextFieldValidator {
  @override
  String? validate(String? value) {
    return null;
  }
}
