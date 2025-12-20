import '../entities/app_theme.dart';

abstract class ThemeRepository {
  Future<AppTheme> getTheme();
  Future<void> saveTheme(AppTheme theme);
}
