import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/jsonplaceholder.dart';

class StackSymThird extends StatefulWidget {
  @override
  _StackSymThirdState createState() => _StackSymThirdState();
}

class _StackSymThirdState extends State<StackSymThird> {
  bool loading = false;
  var commentProvider;
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
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
    print('STACK THIRD => didChangeDependencies called');
  }

  @override
  void dispose() {
    print('STACK THIRD => dispose called');
    super.dispose();
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
