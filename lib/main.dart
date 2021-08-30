import 'package:flutter/material.dart';
import 'package:snake_and_ladder/presentation/pages/game_page.dart';
// import 'package:snake_and_ladder/presentation/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final AppRouter _appRouter = AppRouter();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snakes And Ladders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: App(),
      home: const GamePage(), //sementara
      // onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
