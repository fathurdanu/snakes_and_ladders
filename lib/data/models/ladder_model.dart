// import 'package:snake_and_ladder/data/models/board_model.dart';

class Ladder {
  late List<int> ladderTop;
  late List<int> ladderBottom;
  // late List<int> _cellsNumberList;

  Ladder() {
    // _cellsNumberList = numberingEveryCells();
    ladderTop = buildLadderTop();
    ladderBottom = buildLadderBottom();
  }

  List<int> buildLadderTop() => [22, 56, 71, 63, 95];
  List<int> buildLadderBottom() => [2, 13, 48, 58, 86];
}
