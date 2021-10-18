import 'package:flutter/material.dart';

class TrainBehBottom extends StatefulWidget {
  @override
  _TrainBehBottomState createState() => _TrainBehBottomState();
}

class _TrainBehBottomState extends State<TrainBehBottom> {
  @override
  void initState() {
    super.initState();
    print('--------------------------');
    print('TRAIN - initState called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('TRAIN - didChangeDependencies called');
  }

  @override
  void dispose() {
    print('TRAIN - dispose called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('TRAIN - build called');
    print('--------------------------');

    return Scaffold(
      appBar: AppBar(
        title: Text('Train Bottom'),
      ),
      body: Center(
        child: Text(
          'TRAIN',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
