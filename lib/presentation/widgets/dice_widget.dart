import 'package:flutter/material.dart';
import 'package:snake_and_ladder/data/cubit/calculation/calculation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake_and_ladder/data/models/player_model.dart';

class Dice extends StatelessWidget {
  Player player1;
  Player player2;
  Dice({Key? key, required this.player1, required this.player2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationCubit, CalculationState>(
      builder: (context, state) {
        return Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          color: Colors.brown[600],
          child: InkWell(
            onTap: () {
              if (player1.isMyTurn == true) {
                context.read<CalculationCubit>().increment();
              } else {
                context.read<CalculationCubit>().increment();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width / 7,
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(child: dicePicture(state.dice))),
            ),
          ),
        );
      },
    );
  }

  Image dicePicture(int number) {
    if (number != 0) {
      return Image.asset('assets/dice/dice$number.png',
          width: 100.0, height: 100.0);
    } else {
      return Image.asset('assets/dice/dice1.png', width: 100.0, height: 100.0);
    }
  }
}
