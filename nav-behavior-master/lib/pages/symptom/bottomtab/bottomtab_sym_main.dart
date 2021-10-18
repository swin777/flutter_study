import 'package:flutter/material.dart';
import 'car_sym_bottom.dart';
import 'train_sym_bottom.dart';

class BottomTabSymMain extends StatefulWidget {
  @override
  _BottomTabSymMainState createState() => _BottomTabSymMainState();
}

class _BottomTabSymMainState extends State<BottomTabSymMain> {
  final List<Widget> pages = [
    CarSymBottom(),
    TrainSymBottom(),
  ];

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) {
    return BottomNavigationBar(
      onTap: (int index) => setState(() => _selectedIndex = index),
      currentIndex: selectedIndex,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
    );
  }
}
