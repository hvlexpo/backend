import 'package:flutter/material.dart';
import 'package:hvl_expo/models/models.dart';
import 'package:date_format/date_format.dart';
import '../theme/theme.dart';

class PostPage extends StatelessWidget {
  final Post post;

  PostPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
           flexibleSpace: FlexibleSpaceBar(
             title: Text(post.title, style: TextStyle(
               color: Colors.white,
               fontSize: 16
             )),
             centerTitle: true,
             //titlePadding: EdgeInsets.all(20),
           ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            expandedHeight: 250,
          ),
          SliverFillRemaining(),    ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        label: Text(
          'Go back',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
