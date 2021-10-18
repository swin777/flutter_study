import 'package:flutter/material.dart';

import './stack/stack_sym_first.dart';
import './bottomtab/bottomtab_sym_main.dart';
import '../../widgets/custom_button.dart';

class Symptom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Symptom'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              title: 'Stack',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StackSymFirst();
                  }),
                );
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Bottom Tab',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return BottomTabSymMain();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
