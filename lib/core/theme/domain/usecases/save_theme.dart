import '../entities/app_theme.dart';
import '../repositories/theme_repository.dart';

class SaveTheme {
  final ThemeRepository repository;
  SaveTheme(this.repository);

  Future<void> call(AppTheme theme) {
    return repository.saveTheme(theme);
  }
}
