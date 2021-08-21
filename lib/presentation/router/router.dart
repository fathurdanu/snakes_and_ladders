import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snake_and_ladder/presentation/pages/game_page.dart';
import 'package:snake_and_ladder/presentation/pages/menu_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MenuPage());
      default:
        return MaterialPageRoute(builder: (context) => MenuPage());
    }
  }
}
