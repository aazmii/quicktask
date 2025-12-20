import 'package:quicktask/core/di/providers.dart';
import 'package:quicktask/features/news/domain/usecases/get_top_headlines.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/article.dart';

part 'news_provider.g.dart';

@riverpod
class NewsNotifier extends _$NewsNotifier {
  late final GetTopHeadlines getTopHeadlines;

  @override
  AsyncValue<List<Article>> build() {
    _loadNews();
    return const AsyncLoading();
  }

  Future<void> _loadNews() async {
    try {
      final getTopHeadlines = ref.read(getTopHeadlinesProvider);
      final articles = await getTopHeadlines(NoParams());
      state = AsyncData(articles);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final getTopHeadlinesProvider = Provider<GetTopHeadlines>((ref) {
  return GetTopHeadlines(ref.read(newsRepositoryProvider));
});
