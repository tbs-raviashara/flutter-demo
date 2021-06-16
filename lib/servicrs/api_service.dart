import 'dart:convert';
import 'package:demo/model/article_model.dart';
import 'package:demo/model/users.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String userUrl = 'jsonplaceholder.typicode.com';
  final endPointUrl = "newsapi.org";
  final client = http.Client();
  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'us',
      'category': 'business',
      'apiKey': '453ef7e602e64d47906dfd7e7dd978fd'
    };
    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.https(userUrl, '/users'));
      if (200 == response.statusCode) {
        final List<User> users = usersFromJson(response.body);
        return users;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future sendUser(Map data) async {
    try {
      String body = json.encode(data);
      final response = await http.post(
        Uri.https(userUrl, '/users'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (200 == response.statusCode) {
      } else {}
    } catch (e) {}
  }
}
