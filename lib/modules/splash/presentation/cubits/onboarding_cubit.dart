import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/shared_navigator.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required this.sharedNavigator,
  }) : super(const OnboardingState());

  final SharedNavigator sharedNavigator;

  void onContinueButtonTap() {
    sharedNavigator.openAuthenticationModule();
  }
}
