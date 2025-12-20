import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:quicktask/features/news/data/model/article_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getTopHeadlines();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  static final _apiKey = dotenv.env['API_KEY'] ?? '';
  static final _baseUrl = dotenv.env['BASE_URL'] ?? '';
  // final String apiKey = dotenv.env['API_KEY'] ?? '';
  static final _url = '$_baseUrl/top-headlines?country=us&apiKey=$_apiKey';

  final http.Client client;

  NewsRemoteDataSourceImpl(this.client);

  @override
  Future<List<ArticleModel>> getTopHeadlines() async {
    final response = await client.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];

      return articles.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
