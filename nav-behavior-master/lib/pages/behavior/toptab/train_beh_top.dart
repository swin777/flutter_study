import 'package:flutter/material.dart';

class TrainBehTop extends StatefulWidget {
  @override
  _TrainBehTopState createState() => _TrainBehTopState();
}

class _TrainBehTopState extends State<TrainBehTop> {
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
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('TRAIN - didUpdateWidet called');
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

    return Center(
      child: Text(
        'TRAIN',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
