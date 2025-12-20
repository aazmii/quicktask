import 'package:quicktask/core/theme/data/datasource/theme_local_datasource.dart';
import 'package:quicktask/core/theme/data/repository/theme_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../domain/usecases/get_theme.dart';
import '../domain/usecases/save_theme.dart';

final themeLocalDataSourceProvider =
    Provider((ref) => ThemeLocalDataSource());

final themeRepositoryProvider = Provider(
  (ref) => ThemeRepositoryImpl(ref.read(themeLocalDataSourceProvider)),
);

final getThemeProvider =
    Provider((ref) => GetTheme(ref.read(themeRepositoryProvider)));

final saveThemeProvider =
    Provider((ref) => SaveTheme(ref.read(themeRepositoryProvider)));
