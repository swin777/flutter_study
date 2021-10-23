import 'package:flutter/material.dart';

class BasicSettingsPage extends StatelessWidget {
  BasicSettingsPage({required this.gotoAdvSettingsPage});

  final VoidCallback gotoAdvSettingsPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Basic Settings',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'settings/adv_settings');
              },//gotoAdvSettingsPage,
              child: Text(
                'Advanced Settings',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
