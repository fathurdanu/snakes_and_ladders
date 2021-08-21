import 'package:flutter/material.dart';
import 'package:snake_and_ladder/coba_coba.dart';
import 'package:snake_and_ladder/presentation/pages/game_page.dart';
import 'package:snake_and_ladder/presentation/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snakes And Ladders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: App(),
      home: GamePage(), //sementara
      // onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
