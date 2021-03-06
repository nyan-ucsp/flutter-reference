import 'dart:io';

import 'package:flutter_reference/components/enums.dart';
import 'package:flutter_reference/components/http_client_overrides.dart';
import 'package:flutter_reference/services/navigation_service.dart';
import 'package:flutter_reference/services/theme_service.dart';
import 'package:flutter_reference/views/splash/splash_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = HttpClientOverrides();
  runApp(
    MultiProvider(
      providers: StaticList.providerList,
      child: EasyLocalization(
        child: MyApp(),
        supportedLocales: [
          Locale('en', 'EN'),
          Locale('my', 'MM'),
          Locale('zh', 'CN'),
        ],
        path: 'resources/lang',
        fallbackLocale: Locale('en', 'EN'),
        saveLocale: true,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: ThemeService.systemDefaultTheme == Brightness.dark,
      future: context.watch<ThemeService>().checkThemeMode,
      builder: (context, snapshot) {
        final botToastBuilder = BotToastInit();
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
        );
        return MaterialApp(
          title: 'arktoon',
          theme: snapshot.data == ThemeService.defaultThemeValue
              //Default Theme
              ? ThemeService.systemDefaultTheme == Brightness.dark
                  ? ThemeService.darkTheme.copyWith(
                      textTheme: TextTheme(
                        headline1: TextStyle().copyWith(
                          height:
                              context.locale == Locale('my', 'MM') ? 1.5 : 1,
                        ),
                      ),
                    )
                  : ThemeService.lightTheme
              //Custom Theme
              : snapshot.data == ThemeService.darkThemeValue
                  ? ThemeService.darkTheme
                  : ThemeService.lightTheme,
          builder: (context, child) {
            child = botToastBuilder(context, child);
            return MediaQuery(
              child: child,
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            );
          },
          navigatorObservers: [BotToastNavigatorObserver()],
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: NavigationService.navigationKey,
          initialRoute: SplashScreen.routeName,
          onGenerateRoute: NavigationService.generateRoute,
        );
      },
    );
  }
}
