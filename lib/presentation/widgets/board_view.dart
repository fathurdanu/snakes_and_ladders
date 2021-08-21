import 'package:flutter/material.dart';
import 'package:snake_and_ladder/data/models/board_model.dart';

class BoardView extends StatelessWidget {
  final int _totalRows = 10;
  final int _numberOfCells = 100;
  late int player1Loc, player2Loc;
  late final Color player1Color, player2Color;
  late final List<int> _cellsNumberList;
  late double playerSize;
  BoardModel boardModel = BoardModel();

  /// Constructor, need colors for both players
  /// Constructor, butuh warna untuk kedua player
  BoardView({
    Key? key,
    required this.player1Color,
    required this.player2Color,
  }) : super(key: key) {
    _cellsNumberList = boardModel.cellNumberList;
    player1Loc = boardModel.searchIndexList(1);
    player2Loc = boardModel.searchIndexList(1);
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
    player1Loc = boardModel.searchIndexList(55);
    dynamicPlayerSize(context);
    int index = 0;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: _numberOfCells,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _totalRows),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.black, width: 0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_cellsNumberList[index]}',
                    style: TextStyle(fontSize: dynamicFontSize(context)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        width: playerSize,
                        height: playerSize,
                        decoration: BoxDecoration(
                          color: (player1Loc == index)
                              ? player1Color
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        width: playerSize,
                        height: playerSize,
                        decoration: BoxDecoration(
                          color: (player2Loc == index)
                              ? player2Color
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
