import 'package:flutter/material.dart';
import 'package:navlf/pages/behavior/bottomtab/car_beh_bottom.dart';
import 'package:navlf/pages/behavior/bottomtab/train_beh_bottom.dart';

class BottomTabBehMain extends StatefulWidget {
  @override
  _BottomTabBehMainState createState() => _BottomTabBehMainState();
}

class _BottomTabBehMainState extends State<BottomTabBehMain> {
  final List<Widget> pages = [
    CarBehBottom(),
    TrainBehBottom(),
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
