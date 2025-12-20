class Article {
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String content;
  final DateTime publishedAt;
  final String sourceName;
  final String author;

  const Article({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.content,
    required this.publishedAt,
    required this.sourceName,
    required this.author,
  });
}
