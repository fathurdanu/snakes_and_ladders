import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  // const Dice({ Key? key }) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 8,
      height: MediaQuery.of(context).size.height / 8,
      color: Colors.grey,
      child: Image.asset('dice/dice1.png'),
    );
  }
}
