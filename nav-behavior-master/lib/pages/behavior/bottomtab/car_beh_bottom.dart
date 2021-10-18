import 'package:flutter/material.dart';

class CarBehBottom extends StatefulWidget {
  @override
  _CarBehBottomState createState() => _CarBehBottomState();
}

class _CarBehBottomState extends State<CarBehBottom> {
  @override
  void initState() {
    super.initState();
    print('--------------------------');
    print('CAR - initState called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('CAR - didChangeDependencies called');
  }

  @override
  void dispose() {
    print('CAR - dispose called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('CAR - build called');
    print('--------------------------');

    return Scaffold(
      appBar: AppBar(
        title: Text('Car Bottom'),
      ),
      body: Center(
        child: Text(
          'CAR',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
