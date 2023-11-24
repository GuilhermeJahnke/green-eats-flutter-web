import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication_navigator.dart';

part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  CreateNewPasswordCubit({
    required this.navigator,
  }) : super(const CreateNewPasswordState());

  final AuthenticationNavigator navigator;

  void onPasswordChanged(String? value) {}

  void onConfirmPasswordChanged(String? value) {}

  void onResetPasswordTap() {
    navigateToLogin();
  }

  void navigateToLogin() {
    navigator.popToLoginPage();
  }
}
