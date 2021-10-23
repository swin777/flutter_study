import 'package:flutter/material.dart';

class RootChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Root Child'),
      ),
      body: Center(
        child: Text(
          'Root Child',
          style: TextStyle(fontSize: 48.0),
        ),
      ),
    );
  }
}
