import 'package:http/http.dart' as http;
import 'package:news_app/entity/source.dart';

class NewsApi {
  static const _KEY = "57a79eac5a8f44efa2bd3408139b83f3";
  static const _BASE_URL = "https://newsapi.org/v2";

  const NewsApi();

  Future<http.Response> getArticles(Source source, int page) async {
    final url = "$_BASE_URL/everything?sources=${source.id}&apiKey=$_KEY&page=$page";
    return _validate(await http.get(url));
  }

  Future<http.Response> getSources() async {
    final url = "$_BASE_URL/sources?apiKey=$_KEY";
    return _validate(await http.get(url));
  }

  http.Response _validate(http.Response response) {
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Network error: ${response.statusCode.toString()}");
    }
  }
}
