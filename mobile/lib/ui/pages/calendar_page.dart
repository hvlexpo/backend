import 'package:flutter/material.dart';
import 'package:hvl_expo/ui/containers/loading_indicator.dart';
import 'package:hvl_expo/data/http/hvl_client.dart';
import 'package:hvl_expo/models/models.dart';
import 'package:hvl_expo/ui/containers/posts_list.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({Key key}) : super(key: key);

  final HvlHttpClient client = HvlHttpClient(date: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: client.fetchPosts(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return LoadingIndicator();
          default:
            if (snapshot.hasData) {
              return RefreshIndicator(
                child: PostsList(context, snapshot.data),
                onRefresh: () => client.fetchPosts(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return LoadingIndicator();
            }
        }
      },
    );
  }
}
