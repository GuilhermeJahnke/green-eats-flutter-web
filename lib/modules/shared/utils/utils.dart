import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Utils {
  const Utils._();

  static Widget autoDetectImage(
    String imagePath, {
    BoxFit? fit,
    double? size,
  }) {
    if (imagePath.contains('https')) {
      return Image.network(
        imagePath,
        fit: fit,
        height: size,
        width: size,
      );
    }

    if (imagePath.contains('assets') && !imagePath.contains('svg')) {
      return Image.asset(
        imagePath,
        fit: fit,
        height: size,
        width: size,
      );
    }

    return SvgPicture.asset(
      imagePath,
      fit: fit ?? BoxFit.contain,
      height: size,
      width: size,
    );
  }

  static ImageProvider autoDetectImageProvider(String imagePath) {
    if (imagePath.contains('http')) {
      return NetworkImage(imagePath);
    } else {
      return AssetImage(imagePath);
    }
  }

  static String formatCurrency(double value) =>
      NumberFormat.simpleCurrency(locale: 'pt-BR').format(value);

  static List<List<T>> groupElements<T>(
    List<T> elements, {
    required int groupSize,
  }) {
    final numberOfGroups = (elements.length % groupSize) == 0
        ? (elements.length / groupSize).floor()
        : (elements.length / groupSize).floor() + 1;

    return List.generate(
      numberOfGroups,
      (i) => elements.skip(i * groupSize).take(groupSize).toList(),
    );
  }

  static String getSaudation() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Bom dia!';
    } else if (hour < 18) {
      return 'Boa tarde!';
    } else {
      return 'Boa noite!';
    }
  }

  static String formatWeight(double weight) {
    if (weight < 1) {
      return '${(weight * 1000).toInt()}g';
    } else {
      return '${weight.toInt()}kg';
    }
  }

  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy - HH:mm');
    return formatter.format(date);
  }

  static bool isEmailValid(String email) {
    final regex = RegExp(
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    );

    return regex.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    // 8 - 16 characters
    final isLengthValid = password.length >= 8 && password.length <= 16;

    // 1 uppercase letter
    final hasUppercaseLetter = password.contains(RegExp(r'[A-Z]'));

    // 1 lowercase letter
    final hasLowercaseLetter = password.contains(RegExp(r'[a-z]'));

    // 1 special character
    final hasSpecialCharacter =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    // 3 sequential characters
    final hasSequentialCharacters = Utils.hasSequentialAscii(password);

    return isLengthValid &&
        hasUppercaseLetter &&
        hasLowercaseLetter &&
        hasSpecialCharacter &&
        !hasSequentialCharacters;
  }

  static bool isCpfValid(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    if (cpf.length != 11 || RegExp(r'(\d)\1{10}').hasMatch(cpf)) {
      return false;
    }

    final List<int> cpfDigits =
        cpf.runes.map((e) => int.parse(String.fromCharCode(e))).toList();

    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += cpfDigits[i] * (10 - i);
    }

    int firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) {
      firstDigit = 0;
    }

    if (firstDigit != cpfDigits[9]) {
      return false;
    }

    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += cpfDigits[i] * (11 - i);
    }

    int secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) {
      secondDigit = 0;
    }

    if (secondDigit != cpfDigits[10]) {
      return false;
    }

    return true;
  }

  static bool isCnpjValid(String cnpj) {
    final regex = RegExp(
      r'^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}$',
    );

    return regex.hasMatch(cnpj);
  }

  static bool hasSequentialAscii(String password) {
    for (var i = 0; i < password.length - 2; i++) {
      if (password.codeUnitAt(i) == password.codeUnitAt(i + 1) - 1 &&
          password.codeUnitAt(i + 1) == password.codeUnitAt(i + 2) - 1) {
        return true;
      }
    }
    return false;
  }
}
