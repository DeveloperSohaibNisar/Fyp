import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_application/theme/theme_provider.dart';

import 'settings_controller.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Switch(
          value: appThemeState.isDarkModeEnabled,
          onChanged: (enabled){
            if(enabled){
              appThemeState.setDarkTheme();
            }
            else {
              appThemeState.setLightTheme();
            }
          },

        ),
      ),
    );
  }
}
