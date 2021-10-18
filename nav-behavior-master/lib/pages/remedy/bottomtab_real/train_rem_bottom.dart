import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/jsonplaceholder.dart';
import '../../../main.dart';

class TrainRemBottom extends StatefulWidget {
  @override
  _TrainRemBottomState createState() => _TrainRemBottomState();
}

class _TrainRemBottomState extends State<TrainRemBottom>
    with RouteAware /*, AutomaticKeepAliveClientMixin*/ {
  bool loading = false;
  bool isFirst = true;
  var todoProvider;
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    print('--------------------------');
    print('TRAIN - initState called');

    Future.delayed(Duration.zero).then((_) async {
      todoProvider = Provider.of<JsonPlaceholder>(context);
      await todoProvider.getTodos();

      todos = todoProvider.todos;

      setState(() => loading = false);
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
    print('TRAIN - didChangeDependencies called');
  }

  @override
  void dispose() {
    print('TRAIN - dispose called');
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // Called when the current route has been pushed.
  void didPush() {
    print("TRAIN => didPush called");
  }

  // Called when a new route has been pushed, and the current route is no longer visible.
  void didPushNext() {
    print("TRAIN => didPushNext called");
  }

  // Called when the current route has been popped off.
  void didPop() {
    print("TRAIN => didPop called");
  }

  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    print("TRAIN => didPopNext called");
  }

  @override
  // bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    print('TRAIN - build called');
    print('--------------------------');

    return Scaffold(
      appBar: AppBar(
        title: Text('Train Bottom'),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : todos.length == 0
              ? Center(
                  child: Text('No todos yet! Please enter some!'),
                )
              : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(todos[index].title),
                        subtitle: todos[index].completed
                            ? Text(
                                'Completed',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              )
                            : Text(
                                'Not yet processed',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                      ),
                    );
                  },
                ),
    );
  }
}
