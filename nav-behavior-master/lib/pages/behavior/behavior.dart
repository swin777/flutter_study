import 'package:flutter/material.dart';
import './stack/stack_beh_first.dart';
import './toptab/toptap_beh_main.dart';
import './bottomtab/bottomtab_beh_main.dart';

import '../../widgets/custom_button.dart';

class Behavior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Behavior'),
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
                    return StackBehFirst();
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
                    return BottomTabBehMain();
                  }),
                );
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Top Tab',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TopTabBehMain();
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
