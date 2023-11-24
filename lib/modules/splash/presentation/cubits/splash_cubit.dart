import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../splash_navigator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.splashNavigator,
  }) : super(const SplashState());

  final SplashNavigator splashNavigator;

  final splashScreenTime = const Duration(seconds: 2);

  Future<void> onInit() async {
    await Future<void>.delayed(splashScreenTime);

    splashNavigator.openOnboardingPage();
  }
}
