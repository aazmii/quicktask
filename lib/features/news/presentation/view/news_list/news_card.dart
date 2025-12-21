import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quicktask/core/extensions/extension.dart';
import 'package:quicktask/features/news/domain/entities/article.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
                child: Hero(
                  tag: article.imageUrl,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: article.imageUrl,
                      placeholder: (context, url) => Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${article.title} |${article.publishedAt.timeAgo}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
