import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stack_sym_second.dart';
import '../../../providers/jsonplaceholder.dart';

class StackSymFirst extends StatefulWidget {
  @override
  _StackSymFirstState createState() => _StackSymFirstState();
}

class _StackSymFirstState extends State<StackSymFirst> {
  bool loading = false;
  var postProvider;
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
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
    print('STACK FIRST => didChangeDependencies called');
  }

  @override
  void dispose() {
    print('STACK FIRST => dispose called');
    super.dispose();
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
                  return StackSymSecond();
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
