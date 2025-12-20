import '../../domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required super.title,
    required super.description,
    required super.url,
    required super.imageUrl,
    required super.content,
    required super.publishedAt,
    required super.sourceName,
    required super.author,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt']),
      sourceName: json['source']?['name'] ?? '',
      author: json['author'] ?? '',
    );
  }
}
