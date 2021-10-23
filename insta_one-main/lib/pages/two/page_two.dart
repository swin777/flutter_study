import 'package:flutter/material.dart';
import 'package:insta_one/pages/two/page_two_one.dart';
import 'package:insta_one/pages/two/page_two_two.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'two/one',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case 'two/one':
            builder = (BuildContext _) => PageTwoOne();
            break;
          case 'two/two':
            builder = (BuildContext _) => PageTwoTwo();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
