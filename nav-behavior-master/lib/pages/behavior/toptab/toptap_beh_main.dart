import 'package:flutter/material.dart';

import 'car_beh_top.dart';
import 'train_beh_top.dart';

class TopTabBehMain extends StatefulWidget {
  @override
  _TopTabBehMainState createState() => _TopTabBehMainState();
}

class _TopTabBehMainState extends State<TopTabBehMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top Tab'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
                text: 'Car',
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: 'Train',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CarBehTop(),
            TrainBehTop(),
          ],
        ),
      ),
    );
  }
}
