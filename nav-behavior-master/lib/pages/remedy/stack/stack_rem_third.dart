import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/jsonplaceholder.dart';
import '../../../main.dart';

class StackRemThird extends StatefulWidget {
  @override
  _StackRemThirdState createState() => _StackRemThirdState();
}

class _StackRemThirdState extends State<StackRemThird> with RouteAware {
  bool loading = false;
  var commentProvider;
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    print('STACK THIRD => didChangeDependencies called');

    setState(() => loading = true);
    Future.delayed(Duration.zero).then((_) async {
      commentProvider = Provider.of<JsonPlaceholder>(context, listen: false);
      await commentProvider.getComments();

      comments = commentProvider.comments;

      setState(() => loading = false);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    print('STACK THIRD => didChangeDependencies called');
  }

  @override
  void dispose() {
    print('STACK THIRD => dispose called');
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // Called when the current route has been pushed.
  void didPush() {
    print("STACK THIRD => didPush called");
  }

  // Called when a new route has been pushed, and the current route is no longer visible.
  void didPushNext() {
    print("STACK THIRD => didPushNext called");
  }

  // Called when the current route has been popped off.
  void didPop() {
    print("STACK THIRD => didPop called");
  }

  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    print("STACK THIRD => didPopNext called");
  }

  @override
  Widget build(BuildContext context) {
    print('STACK THIRD => build called');
    print('-------------------------------');

    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Third'),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : comments.length == 0
              ? Center(
                  child: Text('No comments yet! '),
                )
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(comments[index].name.toString()),
                        subtitle: Text(comments[index].body.toString()),
                        trailing: Text(comments[index].email.toString()),
                      ),
                    );
                  },
                ),
    );
  }
}
