class BoardModel {
  List<int> _cellsNumberList = [];

  BoardModel() {
    _cellsNumberList = numberingEveryCells();
  }

  get cellNumberList => _cellsNumberList;

  /// create a list of cell numbers
  /// buat list untuk nomor cell
  List<int> numberingEveryCells() {
    int _number = 0;
    bool _canDividedBy10 = false;
    int _oneToten = 0;
    List<int> numberList = [];

    for (int idx = 0; idx <= 100; idx++) {
      if (_canDividedBy10) {
        _number = (_oneToten + (10 * ((100 - (idx + 1)) ~/ 10)));
      } else {
        _number = 100 - idx;
      }
      if ((idx + 1) % 10 == 0) {
        _canDividedBy10 = !_canDividedBy10;
        _oneToten = 0;
      }
      _oneToten++;
      numberList.add(_number);
    }
    return numberList;
  }

  /// Cari index berdasarkan nomor cell (nomor pada board)
  int searchIndexList(int number) => _cellsNumberList.indexOf(number);

  /// get a cell number from the board [] by index
  /// Cari nomor cell pada board berdasarkan index
  int searchNumberByIndex(int index) => _cellsNumberList[index];
}
