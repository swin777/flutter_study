import 'package:flutter/material.dart';

class PageTwoOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 21'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Page 21',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'two/two',
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return PageTwoTwo();
                //     },
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              child: Text('To Page 22'),
            ),
          ],
        ),
      ),
    );
  }
}
