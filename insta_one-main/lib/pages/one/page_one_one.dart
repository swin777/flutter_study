import 'package:flutter/material.dart';

class PageOneOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 11'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Page 11',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'one/two',
                );
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              child: Text('To Page 12'),
            ),
          ],
        ),
      ),
    );
  }
}
