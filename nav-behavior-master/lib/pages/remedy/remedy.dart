import 'package:flutter/material.dart';

import './stack/stack_rem_first.dart';
import './bottomtab/bottomtab_rem_main.dart';
import './bottomtab_real/bottomtab_real_rem_main..dart';
import '../../widgets/custom_button.dart';

class Remedy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Remedy'),
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
                    return StackRemFirst();
                  }),
                );
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Bottom Tab\n with RouteObserver',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return BottomTabRemMain();
                  }),
                );
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Bottom Tab\n with No initState',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return BottomTabRealRemMain();
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
