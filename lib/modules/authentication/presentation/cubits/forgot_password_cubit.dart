import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../authentication_navigator.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({
    required this.navigator,
  }) : super(const ForgotPasswordState());

  final AuthenticationNavigator navigator;

  void onEmailChanged(String? value) {}

  void onSendTap() {
    navigator.openCheckYourEmailPage();
  }
}
