part of '../utils.dart';

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
