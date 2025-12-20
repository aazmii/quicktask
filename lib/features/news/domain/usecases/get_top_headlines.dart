import 'package:quicktask/features/news/domain/repositories/article_repository.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/article.dart';

class GetTopHeadlines implements UseCase<List<Article>, NoParams> {
  final NewsRepository repository;

  GetTopHeadlines(this.repository);

  @override
  Future<List<Article>> call(NoParams params) {
    return repository.getTopHeadlines();
  }
}
