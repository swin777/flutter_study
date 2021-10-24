import 'package:flutter/material.dart';
import 'package:insta_two/screens/screens.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> bottomTabs = [
    {
      'index': 0,
      'label': 'feed',
      'icon': Icons.home,
      'key': GlobalKey<NavigatorState>(),
    },
    {
      'index': 1,
      'label': 'search',
      'icon': Icons.search,
      'key': GlobalKey<NavigatorState>(),
    },
    {
      'index': 2,
      'label': 'create',
      'icon': Icons.add,
      'key': GlobalKey<NavigatorState>(),
    },
    {
      'index': 3,
      'label': 'notifications',
      'icon': Icons.notifications,
      'key': GlobalKey<NavigatorState>(),
    },
    {
      'index': 4,
      'label': 'profile',
      'icon': Icons.account_circle_outlined,
      'key': GlobalKey<NavigatorState>(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: bottomTabs
            .map(
              (e) => Offstage(
                offstage: e['index'] != selectedIndex,
                child: Navigator(
                  key: e['key'],
                  initialRoute: '/',
                  onGenerateInitialRoutes: (_, initialRoute) {
                    return [
                      MaterialPageRoute(
                        settings: RouteSettings(name: '/'),
                        builder: (context) => _showNestedScreen(
                          e['label'],
                        ),
                      ),
                    ];
                  },
                ),
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            if (selectedIndex == index) {
              final navigatorKey =
                  bottomTabs[selectedIndex]['key'] as GlobalKey<NavigatorState>;

              navigatorKey.currentState!.popUntil((route) => route.isFirst);
            } else {
              selectedIndex = index;
            }
          });
        },
        items: bottomTabs
            .map(
              (e) => BottomNavigationBarItem(
                label: e['label'],
                icon: Icon(e['icon'], size: 30),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _showNestedScreen(String label) {
    switch (label) {
      case 'feed':
        return FeedScreen();
      case 'search':
        return SearchScreen();
      case 'create':
        return CreatePostScreen();
      case 'notifications':
        return NotificationsScreen();
      case 'profile':
        return ProfileScreen();
      default:
        return Scaffold();
    }
  }
}
