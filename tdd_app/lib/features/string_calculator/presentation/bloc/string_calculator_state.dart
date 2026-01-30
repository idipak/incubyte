import 'package:equatable/equatable.dart';

sealed class StringCalculatorState extends Equatable {
  const StringCalculatorState();

  @override
  List<Object> get props => [];
}

final class StringCalculatorInitial extends StringCalculatorState {}

final class StringCalculatorLoading extends StringCalculatorState {}

final class StringCalculatorLoaded extends StringCalculatorState {
  final int result;

  const StringCalculatorLoaded(this.result);

  @override
  List<Object> get props => [result];
}

final class StringCalculatorError extends StringCalculatorState {
  final String message;

  const StringCalculatorError(this.message);

  @override
  List<Object> get props => [message];
}
