import 'package:flutter/material.dart';

class CarBehTop extends StatefulWidget {
  @override
  _CarBehTopState createState() => _CarBehTopState();
}

class _CarBehTopState extends State<CarBehTop> {
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
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('CAR - didUpdateWidet called');
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

    return Center(
      child: Text(
        'CAR',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
