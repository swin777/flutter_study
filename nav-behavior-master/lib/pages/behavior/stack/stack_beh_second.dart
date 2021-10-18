import 'package:flutter/material.dart';
import 'package:navlf/pages/behavior/stack/stack_beh_third.dart';
import 'package:navlf/widgets/custom_button.dart';

class StackBehSecond extends StatefulWidget {
  @override
  _StackBehSecondState createState() => _StackBehSecondState();
}

class _StackBehSecondState extends State<StackBehSecond> {
  @override
  void initState() {
    super.initState();
    print('-------------------------------');
    print('STACK SECOND => initState called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('STACK SECOND => didChangeDependencies called');
  }

  @override
  void dispose() {
    print('STACK SECOND => dispose called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('STACK SECOND => build called');
    print('-------------------------------');

    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Second'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Stack Second',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Go to Stack Third',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StackBehThird();
                  }),
                );
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Go back to Stack One',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
