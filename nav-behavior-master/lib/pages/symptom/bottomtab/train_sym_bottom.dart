import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/jsonplaceholder.dart';

class TrainSymBottom extends StatefulWidget {
  @override
  _TrainSymBottomState createState() => _TrainSymBottomState();
}

class _TrainSymBottomState extends State<TrainSymBottom> {
  bool loading = false;
  bool isFirst = true;
  var todoProvider;
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    print('--------------------------');
    print('TRAIN - initState called');
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
