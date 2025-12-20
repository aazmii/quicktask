import 'package:quicktask/core/theme/data/datasource/theme_local_datasource.dart';

import '../../domain/entities/app_theme.dart';
import '../../domain/repositories/theme_repository.dart';
 
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource local;

  ThemeRepositoryImpl(this.local);

  @override
  Future<AppTheme> getTheme() {
    return local.getTheme();
  }

  @override
  Future<void> saveTheme(AppTheme theme) {
    return local.saveTheme(theme);
  }
}
