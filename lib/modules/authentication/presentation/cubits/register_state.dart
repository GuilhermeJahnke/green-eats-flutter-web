part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = Status.initial,
    this.failure,
    this.name,
    this.lastName,
    this.cpf,
    this.email,
    this.password,
    this.confirmPassword,
  });

  final Status status;
  final Failure? failure;

  final String? name;
  final String? lastName;
  final String? cpf;
  final String? email;
  final String? password;
  final String? confirmPassword;

  bool get isButtonEnabled =>
      name?.trim() != null &&
      lastName?.trim() != null &&
      cpf?.trim() != null &&
      email?.trim() != null &&
      password?.trim() != null &&
      confirmPassword == password;

  @override
  List<Object?> get props => [
        status,
        failure,
        name,
        lastName,
        cpf,
        email,
        password,
        confirmPassword,
      ];

  RegisterState copyWith({
    Status? status,
    Failure? failure,
    String? name,
    String? lastName,
    String? cpf,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
