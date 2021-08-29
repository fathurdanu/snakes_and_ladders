import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math';

part 'randomdice_state.dart';

class RandomdiceCubit extends Cubit<RandomdiceState> {
  RandomdiceCubit() : super(RandomdiceState(number: 0));
  Random rnd = new Random();
  int _min = 1;
  int _max = 6;

  void shuffle() =>
      emit(RandomdiceState(number: _min + rnd.nextInt(_max - _min)));
}
