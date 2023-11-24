import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../shared/domain/entities/status.dart';
import '../../../shared/domain/entities/user.dart';
import '../../../shared/domain/errors/failures/failure.dart';
import '../../../shared/domain/usecases/update_hive_user_usecase.dart';
import '../../../shared/shared_navigator.dart';
import '../../../shared/utils/utils.dart';
import '../../domain/usecases/sign_up_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required SharedNavigator sharedNavigator,
    required SignUpUseCase signUpUseCase,
    required UpdateHiveUserUsecase updateUserUsecase,
  })  : _sharedNavigator = sharedNavigator,
        _signUpUseCase = signUpUseCase,
        _updateUserUsecase = updateUserUsecase,
        super(const RegisterState());

  final SharedNavigator _sharedNavigator;
  final SignUpUseCase _signUpUseCase;
  final UpdateHiveUserUsecase _updateUserUsecase;

  void onNameChanged(String? value) {
    if (value == null) return;

    emit(state.copyWith(name: value));
  }

  void onLastNameChanged(String? value) {
    if (value == null) return;

    emit(state.copyWith(lastName: value));
  }

  void onCpfChanged(String? value) {
    if (value == null) return;

    if (Utils.isCpfValid(value)) {
      emit(state.copyWith(cpf: value));
      return;
    }
  }

  void onEmailChanged(String? value) {
    if (value == null) return;

    if (Utils.isEmailValid(value)) {
      emit(state.copyWith(email: value));
      return;
    }
  }

  void onPasswordChanged(String? value) {
    if (value == null) return;

    if (value.length >= 6) {
      emit(state.copyWith(password: value));
      return;
    }
  }

  void onConfirmPasswordChanged(String? value) {
    if (value == null) return;

    emit(state.copyWith(confirmPassword: value));
  }

  String? confirmPasswordValidator(String? value) {
    if (value != state.password) {
      return 'As senhas não coincidem';
    }

    return null;
  }

  Future<void> _signUp() async {
    emit(state.copyWith(status: Status.loading));

    final result = await _signUpUseCase.signUp(
      name: state.name!,
      lastName: state.lastName!,
      document: state.cpf!,
      email: state.email!,
      password: state.password!,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: Status.failure,
            failure: failure,
          ),
        );
      },
      (user) {
        emit(
          state.copyWith(status: Status.success),
        );

        _updateCurrentUser(user);
      },
    );
  }

  Future<void> _updateCurrentUser(User user) async {
    await _updateUserUsecase.updateUser(user);

    _sharedNavigator.openMainModule();
  }

  void onRegisterTap() {
    _signUp();
  }

  void onTermsAndConditionsTap() {}
}
