import 'package:flutter/material.dart';
import 'car_rem_bottom.dart';
import 'train_rem_bottom.dart';

class BottomTabRealRemMain extends StatefulWidget {
  @override
  _BottomTabRealRemMainState createState() => _BottomTabRealRemMainState();
}

class _BottomTabRealRemMainState extends State<BottomTabRealRemMain> {
  final List<Widget> pages = [
    CarRemBottom(),
    TrainRemBottom(),
  ];
  final PageController pageController = PageController();

  int _selectedIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: Text('Car'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_transit),
            title: Text('Train'),
          ),
        ],
      ),
    );
  }
}
