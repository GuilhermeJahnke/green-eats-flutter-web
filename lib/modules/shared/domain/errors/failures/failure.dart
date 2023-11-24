import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({
    required this.exception,
  });

  final dynamic exception;

  @override
  List<Object?> get props => [
        exception,
      ];
}
