import 'package:flutter/material.dart';
import 'package:hvl_expo/models/models.dart';
import 'package:date_format/date_format.dart';
import '../theme/expo_colors.dart';
import '../pages/post_page.dart';

class PostItem extends StatelessWidget {
  final Post post;

  PostItem(this.post, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          formatDate(post.startDate, [d, '/', m, ' ', HH, ':', nn]),
          style: TextStyle(color: Colors.black26, fontStyle: FontStyle.italic),
        ),
        Card(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            leading: Icon(
              Icons.calendar_today,
              color: ExpoColors.hvlPrimary,
            ),
            title: Text(
              post.title,
              maxLines: 2,
            ),
            subtitle: Text(post.adress),
            trailing: Text(
              post.campus.substring(0, 2),
              style: TextStyle(
                color: ExpoColors.hvlAccent,
                fontSize: 32,
              ),
            ),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPage(
                          post: post,
                        ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
