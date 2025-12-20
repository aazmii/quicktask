import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quicktask/core/theme/domain/entities/app_theme.dart';
import 'package:quicktask/core/theme/presentation/theme_notifier.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final themeController = context.watch<ThemeController>();
    final themeMode = ref.watch(themeNotifierProvider);
    final notifier = ref.watch(themeNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const SizedBox(height: 8),

          // Section header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Appearance',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          RadioListTile<ThemeMode>(
            title: const Text('System default'),
            value: ThemeMode.system,
            groupValue: themeMode,
            onChanged: (s) => notifier.setTheme(AppTheme.system),
          ),

          RadioListTile<ThemeMode>(
            title: const Text('Light'),
            value: ThemeMode.light,
            groupValue: themeMode,
            onChanged: (s) => notifier.setTheme(AppTheme.light),
          ),

          RadioListTile<ThemeMode>(
            title: const Text('Dark'),
            value: ThemeMode.dark,
            groupValue: themeMode,
            onChanged: (s) => notifier.setTheme(AppTheme.dark),

            // onChanged: themeController.setTheme,
          ),
        ],
      ),
    );
  }
}
