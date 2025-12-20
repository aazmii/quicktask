import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/app_theme.dart';

class ThemeLocalDataSource {
  static const _key = 'app_theme';

  Future<AppTheme> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key);

    switch (value) {
      case 'light':
        return AppTheme.light;
      case 'dark':
        return AppTheme.dark;
      default:
        return AppTheme.system;
    }
  }

  Future<void> saveTheme(AppTheme theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, theme.name);
  }
}
