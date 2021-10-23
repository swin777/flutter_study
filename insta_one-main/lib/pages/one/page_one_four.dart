import 'package:flutter/material.dart';

class PageOneFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 14'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Page 14',
              style: TextStyle(fontSize: 48),
            ),
          ],
        ),
      ),
    );
  }
}
