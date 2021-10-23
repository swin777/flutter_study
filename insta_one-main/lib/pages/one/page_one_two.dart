import 'package:flutter/material.dart';
import 'package:insta_one/pages/one/page_one_four.dart';
import 'package:insta_one/pages/root_child_page.dart';

class PageOneTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 12'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Page 12',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'one/three',
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return PageOneThree();
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
              child: Text('To Page 13'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageOneFour();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              child: Text('To Page 14'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return RootChildPage();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              child: Text('Root Child Page'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Dialog'),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              child: Text('Show Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
