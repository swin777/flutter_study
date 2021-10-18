import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/jsonplaceholder.dart';

class CarSymBottom extends StatefulWidget {
  @override
  _CarSymBottomState createState() => _CarSymBottomState();
}

class _CarSymBottomState extends State<CarSymBottom> {
  bool loading = false;
  var commentProvider;
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    setState(() => loading = true);
    Future.delayed(Duration.zero).then((_) async {
      commentProvider = Provider.of<JsonPlaceholder>(context);
      await commentProvider.getComments();

      comments = commentProvider.comments;

      setState(() => loading = false);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('CAR - didChangeDependencies called');
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Car Bottom'),
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
                        title: Text(comments[index].name),
                        subtitle: Text(comments[index].body),
                        trailing: Text(comments[index].email),
                      ),
                    );
                  },
                ),
    );
  }
}
