part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = Status.initial,
    this.failure,
    this.isButtonEnabled = false,
    this.email,
    this.password,
  });

  final Status status;
  final Failure? failure;

  final bool isButtonEnabled;

  final String? email;
  final String? password;

  bool get isFormValid => email?.trim() != null && password?.trim() != null;

  @override
  List<Object?> get props => [
        status,
        failure,
        isButtonEnabled,
        email,
        password,
      ];

  LoginState copyWith({
    Status? status,
    Failure? failure,
    bool? isButtonEnabled,
    String? email,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
