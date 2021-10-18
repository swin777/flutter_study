import 'package:flutter/material.dart';
import 'car_rem_bottom.dart';
import 'train_rem_bottom.dart';

class BottomTabRemMain extends StatefulWidget {
  @override
  _BottomTabRemMainState createState() => _BottomTabRemMainState();
}

class _BottomTabRemMainState extends State<BottomTabRemMain> {
  final List<Widget> pages = [
    CarRemBottom(),
    TrainRemBottom(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() => _selectedIndex = index);
        },
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
