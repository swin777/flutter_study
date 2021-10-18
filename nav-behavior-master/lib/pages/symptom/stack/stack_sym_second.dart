import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/jsonplaceholder.dart';
import './stack_sym_third.dart';

class StackSymSecond extends StatefulWidget {
  @override
  _StackSymSecondState createState() => _StackSymSecondState();
}

class _StackSymSecondState extends State<StackSymSecond> {
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

    if (isFirst) {
      setState(() => loading = true);

      todoProvider = Provider.of<JsonPlaceholder>(context);
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
    super.dispose();
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
                  return StackSymThird();
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
                        title: Text(todos[index].title),
                        subtitle: todos[index].completed
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
