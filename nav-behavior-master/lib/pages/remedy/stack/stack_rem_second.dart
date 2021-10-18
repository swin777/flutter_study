import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/jsonplaceholder.dart';
import './stack_rem_third.dart';
import '../../../main.dart';

class StackRemSecond extends StatefulWidget {
  @override
  _StackRemSecondState createState() => _StackRemSecondState();
}

class _StackRemSecondState extends State<StackRemSecond> with RouteAware {
  bool loading = false;
  bool isFirst = true;
  var todoProvider;
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    print('-------------------------------');
    print('STACK SECOND => initState called');
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);

    print('STACK SECOND => didChangeDependencies called');

    if (isFirst) {
      setState(() => loading = true);

      todoProvider = Provider.of<JsonPlaceholder>(context, listen: false);
      await todoProvider.getTodos();

      setState(() {
        todos = todoProvider.todos;
        loading = false;
      });

      isFirst = false;
    }
  }

  @override
  void dispose() {
    print('STACK SECOND => dispose called');
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // Called when the current route has been pushed.
  void didPush() {
    print("STACK SECOND => didPush called");
  }

  // Called when a new route has been pushed, and the current route is no longer visible.
  void didPushNext() {
    print("STACK SECOND => didPushNext called");
  }

  // Called when the current route has been popped off.
  void didPop() {
    print("STACK SECOND => didPop called");
  }

  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() async {
    print("STACK SECOND => didPopNext called");

    setState(() => loading = true);

    await todoProvider.getTodos();

    setState(() {
      todos = todoProvider.todos;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('STACK SECOND => build called');
    print('-------------------------------');

    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Second'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.queue_play_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return StackRemThird();
                }),
              );
            },
          )
        ],
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
                        title: Text(todos[index].title.toString()),
                        subtitle: todos[index].completed!
                            ? Text(
                                'Completed',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              )
                            : Text('Not yet processed',
                                style: TextStyle(
                                  color: Colors.red,
                                )),
                      ),
                    );
                  },
                ),
    );
  }
}
