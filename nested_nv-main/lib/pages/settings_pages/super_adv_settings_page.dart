import 'package:flutter/material.dart';

class SuperAdvSettingsPage extends StatelessWidget {
  SuperAdvSettingsPage({required this.finishedSettings});
  final Future<void> Function() finishedSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Super Advanced Settings',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: finishedSettings,
              child: Text(
                'Done',
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
