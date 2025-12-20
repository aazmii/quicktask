import 'package:flutter/material.dart';
import 'package:quicktask/features/news/domain/entities/article.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Row(
          children: [
            if (article.imageUrl.isNotEmpty)
              Hero(
                tag: article.imageUrl,
                child: Image.network(
                  article.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                article.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      // child: ListTile(
      //   leading: article.imageUrl.isNotEmpty
      //       ? Image.network(article.imageUrl, width: 80, fit: BoxFit.cover)
      //       : null,
      //   title: Text(article.title),
      // ),
    );
  }
}
