import 'package:flutter/material.dart';
import 'package:tendemo/api_resources/api_models/movie_detail_model.dart';
import 'package:tendemo/navigation/params/home_screen_args.dart';
import 'package:tendemo/navigation/params/movie_detail_screen_args.dart';
import 'package:tendemo/presentation/views/home_screen.dart';
import 'package:tendemo/presentation/views/main_screen.dart';
import 'package:tendemo/presentation/views/watch_section/movie_detail_screen.dart';
import 'package:tendemo/presentation/views/watch_section/seat_selection_screen.dart';
import 'package:tendemo/presentation/views/watch_section/theater_selection_screen.dart';
import 'package:tendemo/presentation/views/watch_section/trailer_screen.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return route(HomeScreen(params: settings.arguments as HomeScreenArgs?));
      case MainScreen.routeName:
        return route(const MainScreen());
      case MovieDetailScreen.routeName:
        return route(MovieDetailScreen(
            params: settings.arguments as int));
                  case TheaterSelectionScreen.routeName:
        return route(TheaterSelectionScreen(
            params: settings.arguments as MovieDetailModel));
                  case SeatSelectionScreen.routeName:
        return route(SeatSelectionScreen(
            params: settings.arguments as MovieDetailModel));
                  case TrailerScreen.routeName:
        return route(TrailerScreen(
            params: settings.arguments as int));
      // case FirstScreen.routeName:
      //   return route(FirstScreen(
      //       firstScreenArgs: settings.arguments as FirstScreenArgs));
      default:
        return route(const ErrorRoute());
    }
  }
}

Route route(Widget screen) => MaterialPageRoute(builder: (context) => screen);

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('You should not be here...')));
}
