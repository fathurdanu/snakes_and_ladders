import 'package:flutter/material.dart';
import 'package:snake_and_ladder/presentation/widgets/board_view.dart';
import 'package:snake_and_ladder/presentation/widgets/dice_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Color player1Color, player2Color;

  /// get width size of screen
  /// ambil ukuran lebar layar
  void widthScreenSize(context) => MediaQuery.of(context).size.width;

  /// get height size of screen
  /// ambil ukuran tinggi layar
  void heightScreenSize(context) => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoardView(
              player1Color: Colors.red,
              player2Color: Colors.blue,
            ),
            Dice(),
          ],
        ),
      ),
    );
  }
}