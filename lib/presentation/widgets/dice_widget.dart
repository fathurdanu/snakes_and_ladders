import 'package:flutter/material.dart';
import 'package:snake_and_ladder/data/cubit/calculation/calculation_cubit.dart';
// import 'package:snake_and_ladder/data/cubit/randomDice/randomdice_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dice extends StatefulWidget {
  // const Dice({ Key? key }) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationCubit, CalculationState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            // context.read<RandomdiceCubit>().shuffle();
            context.read<CalculationCubit>().increment();
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 8,
            height: MediaQuery.of(context).size.height / 8,
            color: Colors.grey,
            child: dicePicture(state.dice),
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
