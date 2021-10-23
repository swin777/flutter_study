import 'package:flutter/material.dart';

class AdvSettingsPage extends StatelessWidget {
  AdvSettingsPage({required this.gotoSuperAdvSettingsPage});

  final VoidCallback gotoSuperAdvSettingsPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Advanced Settings',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: gotoSuperAdvSettingsPage,
              child: Text(
                'Super Advanced Settings',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
