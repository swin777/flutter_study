import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/jsonplaceholder.dart';
import '../../../main.dart';

class CarRemBottom extends StatefulWidget {
  @override
  _CarRemBottomState createState() => _CarRemBottomState();
}

class _CarRemBottomState extends State<CarRemBottom>
    with RouteAware, AutomaticKeepAliveClientMixin {
  bool loading = false;
  var commentProvider;
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    print('--------------------------');
    print('CAR - initState called');
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
    routeObserver.subscribe(this, ModalRoute.of(context));
    print('CAR - didChangeDependencies called');
  }

  @override
  void dispose() {
    print('CAR - dispose called');
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // Called when the current route has been pushed.
  void didPush() {
    print("CAR => didPush called");
  }

  // Called when a new route has been pushed, and the current route is no longer visible.
  void didPushNext() {
    print("CAR => didPushNext called");
  }

  // Called when the current route has been popped off.
  void didPop() {
    print("CAR => didPop called");
  }

  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    print("CAR => didPopNext called");
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
