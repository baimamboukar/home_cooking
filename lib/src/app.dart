import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_cooking/models/plat.dart';
import 'package:home_cooking/screens/screens.dart';
import 'package:home_cooking/services/services.dart';
import 'package:home_cooking/utils/utils.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class HomeCooking extends HookWidget {
  const HomeCooking({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        // AwesomeNotifications().actionStream.listen((receivedNotification) {
        //   Get.toNamed(
        //     '/login', // your page params. I recommend to you to pass all *receivedNotification* object
        //   );
        // });
        return GetMaterialApp(
            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            ///   supportedLocales: AppLocalizations.supportedLocales,
            supportedLocales: const [
              Locale(
                'en',
              ), // English, no country code
              Locale(
                'fr',
              ),
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) => "Home cooking",

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(
                textTheme: GoogleFonts.josefinSansTextTheme(
                    Theme.of(context).textTheme),
                primaryColor: Colors.cyan,
                primarySwatch: Colors.cyan),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case Login.routeName:
                      return const Login();
                    case Signup.routeName:
                      return const Signup();
                    case PlatDetails.routeName:
                      return PlatDetails(plat: routeSettings.arguments as Plat);
                    case SampleItemDetailsView.routeName:
                      return const SampleItemDetailsView();
                    case SampleItemListView.routeName:
                    default:
                      return const SampleItemListView();
                  }
                },
              );
            },
            home: const Root());
      },
    );
  }
}
