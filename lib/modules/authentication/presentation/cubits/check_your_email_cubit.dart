import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication_navigator.dart';

part 'check_your_email_state.dart';

class CheckYourEmailCubit extends Cubit<CheckYourEmailState> {
  CheckYourEmailCubit({
    required this.navigator,
  }) : super(const CheckYourEmailState());

  final AuthenticationNavigator navigator;

  void onAlreadyCheckedTap() {
    navigator.openNewPasswordPage();
  }

  void onTryWithAnotherEmailTap() {}
}
