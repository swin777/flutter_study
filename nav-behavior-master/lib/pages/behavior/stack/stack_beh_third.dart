import 'package:flutter/material.dart';
import 'package:navlf/widgets/custom_button.dart';

class StackBehThird extends StatefulWidget {
  @override
  _StackBehThirdState createState() => _StackBehThirdState();
}

class _StackBehThirdState extends State<StackBehThird> {
  @override
  void initState() {
    super.initState();
    print('-------------------------------');
    print('STACK THIRD => initState called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('STACK THIRD => didChangeDependencies called');
  }

  @override
  void dispose() {
    print('STACK THIRD => dispose called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('STACK THIRD => build called');
    print('-------------------------------');

    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Third'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Stack Third',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Go back to Stack Second',
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
