import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quicktask/features/news/presentation/provider/news_provider.dart';
import 'package:quicktask/features/news/presentation/view/news_detail/news_detail.dart'
    show NewsDetailPage;
import 'package:quicktask/features/news/presentation/view/news_list/news_card.dart';
import 'package:quicktask/core/extensions/extension.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Latest News')),
      body: newsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (articles) => RefreshIndicator(
          onRefresh: () async {
            ref.refresh(newsNotifierProvider);
          },
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return NewsDetailPage(
                          title: article.title,
                          content: article.content,
                          description: article.description,
                          imageUrl: article.imageUrl,
                          publisher: article.author,
                          timeAgo: article.publishedAt.timeAgo,
                        );
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                    ),
                  );
                },
                child: NewsCard(article: article),
              );
            },
          ),
        ),
      ),
    );
  }
}
