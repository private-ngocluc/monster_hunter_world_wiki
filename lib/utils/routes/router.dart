import 'package:flutter/material.dart';
import 'package:monster_hunter_world_wiki/models/models.dart';
import 'package:monster_hunter_world_wiki/utils/routes/routes.dart';
import 'package:monster_hunter_world_wiki/views/dashboard.dart';
import 'package:monster_hunter_world_wiki/views/views.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardRoute:
        return MaterialPageRoute(builder: (_) => DashBoardScreen());
      case monsterListRoute:
        return MaterialPageRoute(builder: (_) => MonsterListScreen());
      case monsterDetailRoute:
        final Monster args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => MonsterDetailScreen(
                  monster: args,
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
