import 'package:flutter/material.dart';
import 'package:hvl_expo/models/models.dart';
import 'post_item.dart';
import '../theme/expo_colors.dart';
import 'package:date_format/date_format.dart';
import 'package:side_header_list_view/side_header_list_view.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;
  final BuildContext context;

  PostsList(this.context, this.posts, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideHeaderListView(
      padding: EdgeInsets.only(top: 25),
      itemCount: posts.length,
      itemExtend: 150.0,
      headerBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 5, right: 25),
          child: Text(
            formatDate(posts[index].startDate, [M]),
            style: TextStyle(
                color: ExpoColors.hvlPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w500),
          ),
        );
      },
      itemBuilder: (context, index) {
        return PostItem(posts[index]);
      },
      hasSameHeader: (int a, int b) {
        return posts[a].startDate.month == posts[b].startDate.month;
      },
    );
  }

  Future<void> _onRefresh() async {}
}
