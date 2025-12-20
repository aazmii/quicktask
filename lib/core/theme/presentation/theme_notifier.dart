import 'package:flutter/material.dart';
import 'package:quicktask/core/theme/domain/entities/app_theme.dart';
import 'package:quicktask/core/theme/domain/usecases/get_theme.dart';
import 'package:quicktask/core/theme/domain/usecases/save_theme.dart';
import 'package:quicktask/core/theme/presentation/theme_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  late final GetTheme _getTheme;
  late final SaveTheme _saveTheme;

  @override
  ThemeMode build() {
    _getTheme = ref.read(getThemeProvider);
    _saveTheme = ref.read(saveThemeProvider);

    _loadTheme();
    return ThemeMode.system;
  }

  Future<void> _loadTheme() async {
    final theme = await _getTheme();
    state = _mapToThemeMode(theme);
  }

  Future<void> setTheme(AppTheme theme) async {
    await _saveTheme(theme);
    state = _mapToThemeMode(theme);
  }

  ThemeMode _mapToThemeMode(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      case AppTheme.system:
        return ThemeMode.system;
    }
  }
}
