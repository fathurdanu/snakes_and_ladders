import 'package:flutter/material.dart';
import 'package:snake_and_ladder/data/cubit/calculation/calculation_cubit.dart';
import 'package:snake_and_ladder/data/models/board_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake_and_ladder/data/models/player_model.dart';

class BoardView extends StatelessWidget {
  final int _totalRows = 10;
  final int _numberOfCells = 100;
  // late final Color player1Color, player2Color;
  late final List<int> _cellsNumberList;
  late double playerSize;
  BoardModel boardModel = BoardModel();
  Player player1;
  Player player2;

  /// Constructor, need colors for both players
  /// Constructor, butuh warna untuk kedua player
  BoardView({
    Key? key,
    required this.player1,
    required this.player2,
  }) : super(key: key) {
    _cellsNumberList = boardModel.cellNumberList;
  }

  /// get width size of screen
  /// ambil ukuran lebar layar
  double widthScreenSize(context) => MediaQuery.of(context).size.width;

  /// get height size of screen
  /// ambil ukuran tinggi layar
  double heightScreenSize(context) => MediaQuery.of(context).size.height;

  ///resize the font size by width screen
  ///ukuran font disesuaikan dengan lebar layar
  double dynamicFontSize(context) {
    double width = widthScreenSize(context);
    if (width < 400 && width > 300) {
      return 8.0;
    } else if (width <= 300) {
      return 4.0;
    } else {
      return 12.0;
    }
  }

  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
  }

  ///resize the Player size by width screen
  ///ukuran Player disesuaikan dengan lebar layar
  void dynamicPlayerSize(context) {
    double width = widthScreenSize(context);
    if (width > 400) {
      playerSize = width / 35;
    } else {
      playerSize = 7.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamicPlayerSize(context);
    int index = 0;
    return Flexible(
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          controller: controller,
          child: Container(
            width: constraints.maxWidth,
            height: constraints.maxWidth, // / 10 * (_numberOfCells ~/ 10),
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    color: Colors.brown[600],
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _numberOfCells,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _totalRows),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 0.1),
                        ),
                        child: Text(
                          '${_cellsNumberList[index]}',
                          style: TextStyle(
                              fontSize: dynamicFontSize(context),
                              color: Colors.white),
                        ),
                      );
                    },
                  ),
                  Image.asset(
                    'assets/board/board.png',
                    fit: BoxFit.fill,
                  ),
                  BlocConsumer<CalculationCubit, CalculationState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return AnimatedPositioned(
                        top: (boardModel.searchIndexList(player1.location) ~/
                                    10) *
                                (constraints.maxWidth / 10) +
                            ((constraints.maxWidth / 25) -
                                boardModel.searchIndexList(player1.location) /
                                    5),
                        left: (boardModel.searchIndexList(player1.location) %
                                    10) *
                                (constraints.maxWidth / 10) +
                            ((constraints.maxWidth / 40) -
                                (boardModel.searchIndexList(player1.location) %
                                    10)),
                        child: Container(
                          padding: EdgeInsets.all(1),
                          width: playerSize,
                          height: playerSize,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: player1.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        duration: Duration(milliseconds: 400),
                      );
                    },
                  ),
                  BlocConsumer<CalculationCubit, CalculationState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return AnimatedPositioned(
                        top: (boardModel.searchIndexList(player2.location) ~/
                                    10) *
                                (constraints.maxWidth / 10) +
                            ((constraints.maxWidth / 25) -
                                boardModel.searchIndexList(player2.location) /
                                    5),
                        left: (boardModel.searchIndexList(player2.location) %
                                    10) *
                                (constraints.maxWidth / 10) +
                            ((constraints.maxWidth / 40) -
                                (boardModel.searchIndexList(player2.location) %
                                    10)),
                        child: Container(
                          padding: EdgeInsets.all(1),
                          width: playerSize,
                          height: playerSize,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: player2.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        duration: Duration(milliseconds: 400),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
