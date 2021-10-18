import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stack_rem_second.dart';
import '../../../providers/jsonplaceholder.dart';
import '../../../main.dart';

class StackRemFirst extends StatefulWidget {
  @override
  _StackRemFirstState createState() => _StackRemFirstState();
}

class _StackRemFirstState extends State<StackRemFirst> with RouteAware {
  bool loading = false;
  var postProvider;
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    print('STACK FIRST => initState called');

    setState(() => loading = true);
    Future.delayed(Duration.zero).then((_) async {
      postProvider = Provider.of<JsonPlaceholder>(context, listen: false);
      await postProvider.getPosts();

      posts = postProvider.posts;

      setState(() => loading = false);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    print('STACK FIRST => didChangeDependencies called');
  }

  @override
  void dispose() {
    print('STACK FIRST => dispose called');
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // Called when the current route has been pushed.
  void didPush() {
    print("STACK FIRST => didPush called");
  }

  // Called when a new route has been pushed, and the current route is no longer visible.
  void didPushNext() {
    print("STACK FIRST => didPushNext called");
  }

  // Called when the current route has been popped off.
  void didPop() {
    print("STACK FIRST => didPop called");
  }

  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    print("STACK FIRST => didPopNext called");
  }

  @override
  Widget build(BuildContext context) {
    print('STACK FIRST => build called');
    print('-------------------------------');

    return Scaffold(
      appBar: AppBar(
        title: Text('Stack First'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.queue_play_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return StackRemSecond();
                }),
              );
            },
          ),
        ],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : posts.length == 0
              ? Center(
                  child: Text('No Post Yet! Please Post some!'),
                )
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(posts[index].title.toString()),
                        subtitle: Text(posts[index].body.toString()),
                      ),
                    );
                  },
                ),
    );
  }
}
