import 'package:flutter/material.dart';
//import 'package:insta_one/pages/one/page_one.dart';

import 'package:insta_one/pages/one/page_one_one.dart';
import 'package:insta_one/pages/one/page_one_three.dart';
import 'package:insta_one/pages/one/page_one_two.dart';
//import 'package:insta_one/pages/two/page_two.dart';

import 'package:insta_one/pages/two/page_two_one.dart';
import 'package:insta_one/pages/two/page_two_two.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<Widget> _pages = [
  //   PageOne(),
  //   PageTwo(),
  // ];
  int _selectedIndex = 0;

  static final _navKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Navigator> _navigators = [
    Navigator(
      key: _navKeys[0],
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
    ),
    Navigator(
      key: _navKeys[1],
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
    ),
  ];

  Widget _bottomNavigationBar(int selectedIndex) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[200],
      currentIndex: selectedIndex,
      onTap: (int index) {
        setState(() {
          if (_selectedIndex != index) {
            _selectedIndex = index;
          } else {
            _navKeys[index].currentState!.popUntil((route) => route.isFirst);
          }
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_1),
          label: 'One',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_2),
          label: 'Two',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await _navKeys[_selectedIndex].currentState!.maybePop(),
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _navigators,
        ),
        //body: _pages[_selectedIndex],
        bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      ),
    );
  }
}
