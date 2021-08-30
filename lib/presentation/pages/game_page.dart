import 'package:flutter/material.dart';
import 'package:snake_and_ladder/data/cubit/calculation/calculation_cubit.dart';
import 'package:snake_and_ladder/presentation/widgets/board_view.dart';
import 'package:snake_and_ladder/presentation/widgets/dice_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake_and_ladder/data/models/player_model.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // late Color player1Color, player2Color;
  Player player1 = new Player(color: Colors.red, isMyTurn: true);
  Player player2 = new Player(color: Colors.blue);

  /// get width size of screen
  /// ambil ukuran lebar layar
  void widthScreenSize(context) => MediaQuery.of(context).size.width;

  /// get height size of screen
  /// ambil ukuran tinggi layar
  void heightScreenSize(context) => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: BlocProvider<CalculationCubit>(
          create: (BuildContext context) =>
              CalculationCubit(player1: player1, player2: player2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Classic Snakes and Ladders',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              BoardView(
                player1: player1,
                player2: player2,
              ),
              SizedBox(
                height: 10,
              ),
              Dice(
                player1: player1,
                player2: player2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
