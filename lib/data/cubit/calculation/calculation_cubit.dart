import 'package:bloc/bloc.dart';
import 'dart:math';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit() : super(CalculationState(number: 0, dice: 0));

  Random rnd = new Random();
  static const int _min = 1;
  static const int _max = 6;

  void increment() {
    int dice = shuffle();
    int sum = state.number + dice;
    if (sum < 100) {
      emit(CalculationState(number: sum, dice: dice));
    } else if (sum == 100) {
      emit(CalculationState(number: 0, dice: dice));
    } else {
      emit(CalculationState(number: 100 - (sum - 100), dice: dice));
    }
  }

  int shuffle() => _min + rnd.nextInt(_max - _min);
}
