import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:hvl_expo/models/models.dart';

class ExpoHttpClient {
  final String baseUri = 'https://expo.sondregjellestad.space';
  final String id;

  const ExpoHttpClient({this.id});

  Future<List<Exhibition>> fetchExhibitions() async {
    final response = await get('$baseUri/exhibitions/test');

    if (response.statusCode == 200) {
      var items = jsonDecode(response.body) as List;
      List<Exhibition> exhibitions =
          items.map((i) => Exhibition.fromJson(i)).toList();

      return exhibitions;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Exhibition> fetchExhibitionById(id) async {
    final response = await get('$baseUri/exhibitions/$id');
    var json = jsonDecode(response.body);
    return Exhibition.fromJson(json);
  }
}
