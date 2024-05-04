import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fyp_application/core/constants/theme/dark.dart';
import 'package:fyp_application/core/constants/theme/light.dart';
import 'package:fyp_application/features/login/signin.dart';
import 'package:fyp_application/features/login/signup.dart';
import 'package:fyp_application/features/pdf_summary/pdf_summary_tabs_view.dart';
import 'package:fyp_application/state/app_state.dart';
import 'package:provider/provider.dart';

import 'features/home/home_view.dart';
import 'features/login/welcome.dart';
import 'features/recorder/recorder_view.dart';
import 'features/recording_summary/recording_summary_tabs_view.dart';
import 'features/settings/settings_controller.dart';
import 'features/settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider(
          create: (context) => AppState(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case RecorderView.routeName:
                      return const RecorderView();
                    case RecordTabView.routeName:
                      return const RecordTabView();
                    case PdfTabsView.routeName:
                      return const PdfTabsView();
                    case HomeView.routeName:
                      return const HomeView();
                    case Signup.routeName:
                      return const Signup();
                    case SignIn.routeName:
                      return const SignIn();
                    case Welcome.routeName:
                    default:
                      return const HomeView();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
