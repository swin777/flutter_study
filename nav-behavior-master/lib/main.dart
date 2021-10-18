import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/behavior/behavior.dart';
import 'pages/symptom/symptom.dart';
import 'pages/remedy/remedy.dart';
import 'widgets/custom_button.dart';
import 'providers/jsonplaceholder.dart';

void main() => runApp(MyApp());

// global RouteObserver
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: JsonPlaceholder(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navigation Behavior',
        navigatorObservers: <NavigatorObserver>[routeObserver],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav Behavior'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              title: 'Behavior',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Behavior();
                  }),
                );
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Symptom',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Symptom();
                  }),
                );
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Remedy',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Remedy();
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
