import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/utils/mixins/context_mixin.dart';
import '../../../../../shared/utils/mixins/status_mixin.dart';
import '../../profile_module.dart';
import '../atomic/templates/profile_page_template.dart';
import '../cubits/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';
  static const routePath = ProfileModule.routePath + routeName;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get<ProfileCubit>();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state.status.isFailure && state.failure != null) {
          context.showErrorSnackBar(state.failure?.exception?.message);
        }
      },
      listenWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ProfilePageTemplate(
          onPickImageTap: _cubit.onPickImageTap,
          onUpdateTap: _cubit.onUpdateTap,
          onNameChanged: _cubit.onNameChanged,
          onEmailChanged: _cubit.onEmailChanged,
          user: state.user,
          isLoading: state.status.isLoading,
          isButtonEnabled: state.isButtonEnabled,
          onLogoutTap: _cubit.onLogoutTap,
        );
      },
    );
  }
}
