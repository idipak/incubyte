import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tdd_app/features/string_calculator/domain/string_calculator.dart';
import 'string_calculator_event.dart';
import 'string_calculator_state.dart';

class StringCalculatorBloc
    extends Bloc<StringCalculatorEvent, StringCalculatorState> {
  final StringCalculator stringCalculator;

  StringCalculatorBloc(this.stringCalculator)
    : super(StringCalculatorInitial()) {
    on<CalculateSum>(
      _onCalculateSum,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 300))
          .distinct()
          .switchMap(mapper),
    );
  }

  void _onCalculateSum(
    CalculateSum event,
    Emitter<StringCalculatorState> emit,
  ) {
    emit(StringCalculatorLoading());
    try {
      if (event.input.isEmpty) {
        emit(const StringCalculatorLoaded(0));
        return;
      }
      final result = stringCalculator.add(event.input);
      emit(StringCalculatorLoaded(result));
    } catch (e) {
      emit(StringCalculatorError(e.toString()));
    }
  }
}
