import '../entities/app_theme.dart';
import '../repositories/theme_repository.dart';

class GetTheme {
  final ThemeRepository repository;
  GetTheme(this.repository);

  Future<AppTheme> call() {
    return repository.getTheme();
  }
}
