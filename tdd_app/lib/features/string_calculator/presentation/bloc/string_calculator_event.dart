import 'package:equatable/equatable.dart';

sealed class StringCalculatorEvent extends Equatable {
  const StringCalculatorEvent();

  @override
  List<Object> get props => [];
}

final class CalculateSum extends StringCalculatorEvent {
  final String input;

  const CalculateSum(this.input);

  @override
  List<Object> get props => [input];
}
