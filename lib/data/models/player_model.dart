import 'package:flutter/material.dart';

class Player {
  Color color;
  int location = 0;
  bool isMyTurn;

  Player({required this.color, this.isMyTurn = false});
}
