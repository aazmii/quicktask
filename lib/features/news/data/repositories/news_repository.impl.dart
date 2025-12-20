import 'package:quicktask/features/news/data/datasource/datasource.dart';
import 'package:quicktask/features/news/domain/repositories/article_repository.dart' show NewsRepository;

import '../../domain/entities/article.dart';
 

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Article>> getTopHeadlines() {
    return remoteDataSource.getTopHeadlines();
  }
}
