import 'package:flutter/material.dart';

class PageOneThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 13'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Page 13',
              style: TextStyle(fontSize: 48),
            ),
          ],
        ),
      ),
    );
  }
}
