import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:hvl_expo/models/models.dart';

class HvlHttpClient {
  final String baseUri = "https://hvl.no/service/calendar/month/nn-NO";
  final DateTime date;

  const HvlHttpClient({@required this.date});

  Future<List<Post>> fetchPosts() async {
    final response =
        await get('$baseUri/${date.year}/${date.month}/${date.day}');

    Future.delayed(Duration(seconds: 5));

    if (response.statusCode == 200) {
      var items = json.decode(response.body)['items'] as List;
      List<Post> posts = items.map((i) => Post.fromJson(i)).toList();

      var nextMonthItems = json.decode(response.body)['nextMonth'] as List;
      List<Post> nextMonthPosts =
          nextMonthItems.map((i) => Post.fromJson(i)).toList();

      posts.addAll(nextMonthPosts);

      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
