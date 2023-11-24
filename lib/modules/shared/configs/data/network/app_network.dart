import '../../env/environment.dart';

class AppNetwork {
  const AppNetwork({
    required this.environment,
  });

  final Environment environment;

  String get baseUrl => environment.baseUrl;

  String get signIn => '$baseUrl/auth/sign-in';
  String get signUp => '$baseUrl/auth/sign-up';
  String get signOut => '$baseUrl/auth/sign-out';
  String get getCategories => '$baseUrl/categories';
  String get getProducts => '$baseUrl/products';
  String get updateProfile => '$baseUrl/users/';
  String get getAllOrders => '$baseUrl/orders';
  String get sendOrder => '$baseUrl/orders';
}
