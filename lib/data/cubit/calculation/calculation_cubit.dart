import 'package:bloc/bloc.dart';
import 'dart:math';
import 'dart:io';
import 'package:snake_and_ladder/data/models/ladder_model.dart';
import 'package:snake_and_ladder/data/models/player_model.dart';
import 'package:snake_and_ladder/data/models/snake_model.dart';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit({required this.player1, required this.player2})
      : super(CalculationState(dice: 0));

  Ladder ladder = Ladder();
  Snake snake = Snake();
  Random rnd = Random();
  static const int _min = 1;
  static const int _max = 6;
  Player player1;
  Player player2;

  void climb(sum, player) {
    int top = ladder.ladderTop[ladder.ladderBottom.indexOf(sum)];
    player.location = top;
    emit(CalculationState(dice: state.dice));
  }

  void bite(sum, player) {
    int tail = snake.snakeTail[snake.snakeHead.indexOf(sum)];
    player.location = tail;
    emit(CalculationState(dice: state.dice));
  }

  void increment() {
    int dice = shuffle();
    int bantu;
    Player player;
    if (player1.isMyTurn == true) {
      player = player1;
      bantu = 1;
    } else {
      player = player2;
      bantu = 2;
    }

    int sum = player.location + dice;
    print(
        'player: $bantu, from: ${player.location}, dice: $dice, newLocation: now: ${player.location + dice}');
    if (sum < 100) {
      if (ladder.ladderBottom.contains(sum)) {
        climb(sum, player);
      } else if (snake.snakeHead.contains(sum)) {
        bite(sum, player);
      } else {
        player.location = sum;
        emit(CalculationState(dice: dice));
      }
    } else if (sum == 100) {
      player.location = 0;
      emit(CalculationState(dice: dice));
    } else {
      player.location = 100 - (sum - 100);
      emit(CalculationState(dice: dice));
    }

    player1.isMyTurn = !player1.isMyTurn;
    player2.isMyTurn = !player2.isMyTurn;
  }

  int shuffle() => _min + rnd.nextInt(_max - _min);
}
