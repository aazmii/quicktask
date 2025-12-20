import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:quicktask/features/news/data/datasource/datasource.dart';
import 'package:quicktask/features/news/data/repositories/news_repository.impl.dart';
import 'package:quicktask/features/news/domain/repositories/article_repository.dart';

final newsRemoteDataSourceProvider = Provider<NewsRemoteDataSource>((ref) {
  return NewsRemoteDataSourceImpl(http.Client());
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepositoryImpl(ref.read(newsRemoteDataSourceProvider));
});
