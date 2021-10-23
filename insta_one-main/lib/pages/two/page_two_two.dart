import 'package:flutter/material.dart';

class PageTwoTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 22'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Page 22',
              style: TextStyle(fontSize: 48),
            ),
          ],
        ),
      ),
    );
  }
}
