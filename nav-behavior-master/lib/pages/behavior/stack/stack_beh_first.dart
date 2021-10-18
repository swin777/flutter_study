import 'package:flutter/material.dart';
import 'package:navlf/pages/behavior/stack/stack_beh_second.dart';
import 'package:navlf/widgets/custom_button.dart';

class StackBehFirst extends StatefulWidget {
  @override
  _StackBehFirstState createState() => _StackBehFirstState();
}

class _StackBehFirstState extends State<StackBehFirst> {
  @override
  void initState() {
    super.initState();
    print('-------------------------------');
    print('STACK FIRST => initState called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('STACK FIRST => didChangeDependencies called');
  }

  @override
  void dispose() {
    print('STACK FIRST => dispose called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('STACK FIRST => build called');
    print('-------------------------------');

    return Scaffold(
      appBar: AppBar(
        title: Text('Stack First'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Stack First',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Go to Stack Second',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StackBehSecond();
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
