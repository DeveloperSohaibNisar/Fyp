import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_application/core/constants/theme/dark.dart';
import 'package:fyp_application/core/constants/theme/light.dart';
import 'package:fyp_application/features/login/signin.dart';
import 'package:fyp_application/features/login/signup.dart';
import 'package:fyp_application/features/pdf_summary/pdf_summary_tabs_view.dart';

import 'package:fyp_application/theme/theme_provider.dart';

import 'features/home/home_view.dart';
import 'features/login/welcome.dart';
import 'features/recorder/recorder_view.dart';
import 'features/recording_summary/recording_summary_tabs_view.dart';
import 'features/settings/settings_view.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return const SettingsView();
                  case RecorderView.routeName:
                    return const RecorderView();
                  case RecordTabView.routeName:
                    return const RecordTabView();
                  case PdfTabsView.routeName:
                    return const PdfTabsView();
                  case HomeView.routeName:
                    return const HomeView();
                  case Signup.routeName:
                    return Signup();
                  case SignIn.routeName:
                    return SignIn();
                  case Welcome.routeName:
                  default:
                    return const Welcome();
                }
              }

          );
        }
    );
  }
}