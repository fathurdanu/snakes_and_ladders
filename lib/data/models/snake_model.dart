class Snake {
  late List<int> snakeHead;
  late List<int> snakeTail;

  Snake() {
    snakeHead = buildSnakeHead();
    snakeTail = buildSnakeTail();
  }

  List<int> buildSnakeHead() => [47, 60, 74, 93, 98];

  List<int> buildSnakeTail() => [29, 45, 23, 75, 64];
}
