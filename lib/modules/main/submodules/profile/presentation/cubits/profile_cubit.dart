import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../authentication/authentication_module.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/status.dart';
import '../../../../../shared/domain/entities/user.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../../../../shared/domain/usecases/clear_user_usecase.dart';
import '../../../../../shared/domain/usecases/get_current_user_usecase.dart';
import '../../../../../shared/domain/usecases/update_hive_user_usecase.dart';
import '../../domain/usecases/update_user_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> with InitManager {
  ProfileCubit({
    required this.getCurrentUserUsecase,
    required this.updateHiveUserUsecase,
    required this.updateUserUsecase,
    required this.clearUserUsecase,
  }) : super(const ProfileState());

  final GetCurrentUserUsecase getCurrentUserUsecase;
  final UpdateHiveUserUsecase updateHiveUserUsecase;
  final UpdateUserUsecase updateUserUsecase;
  final ClearUserUsecase clearUserUsecase;

  @override
  void init() {
    getUser();
  }

  Future<void> getUser() async {
    emit(state.copyWith(status: Status.loading));

    final user = await getCurrentUserUsecase.getCurrentUser();

    if (user == null) {
      emit(state.copyWith(status: Status.failure));
    } else {
      emit(
        state.copyWith(
          user: user,
          status: Status.success,
        ),
      );
    }
  }

  Future<void> _updateUser() async {
    emit(state.copyWith(status: Status.loading));

    final result = await updateUserUsecase.updateUser(
      userId: state.user!.id,
      name: state.name,
      email: state.email,
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
      (user) async {
        emit(
          state.copyWith(
            user: user,
            status: Status.success,
          ),
        );

        await _updateHiveUser(user);
      },
    );
  }

  Future<void> _updateHiveUser(User user) async {
    await updateHiveUserUsecase.updateUser(user);

    return;
  }

  void onPickImageTap() {}

  void onNameChanged(String? value) {
    if (value != null && value.isNotEmpty) {
      emit(state.copyWith(name: value));
    }
  }

  void onEmailChanged(String? value) {
    if (value != null && value.isNotEmpty) {
      emit(state.copyWith(email: value));
    }
  }

  void onUpdateTap() {
    _updateUser();
  }

  void onLogoutTap() {
    clearUserUsecase.clearUser();

    Modular.to.navigate(AuthenticationModule.moduleName);
  }
}
