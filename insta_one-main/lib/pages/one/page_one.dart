import 'package:flutter/material.dart';
import 'package:insta_one/pages/one/page_one_one.dart';
import 'package:insta_one/pages/one/page_one_three.dart';
import 'package:insta_one/pages/one/page_one_two.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'one/one',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case 'one/one':
            builder = (BuildContext _) => PageOneOne();
            break;
          case 'one/two':
            builder = (BuildContext _) => PageOneTwo();
            break;
          case 'one/three':
            builder = (BuildContext _) => PageOneThree();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
