import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_reference/views/exported_views.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object? argument}) {
    return navigationKey.currentState!
        .pushNamed(routeName, arguments: argument);
  }

  static Future<dynamic> openWebView({required String url}) {
    return navigationKey.currentState!
        .pushNamed(WebViewScreen.routeName, arguments: WebViewScreen(url: url));
  }

  static Future<dynamic> pushNamedAndRemoveUtil(String routeName,
      {Object? argument}) {
    return navigationKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: argument,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// -----------------[Utils]-------------
      case NoInternetConnectionScreen.routeName:
        // final NoInternetConnectionScreen args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => NoInternetConnectionScreen(),
          fullscreenDialog: true,
        );

      /// ----------------------------------
      case SplashScreen.routeName:
        // final SplashScreen args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline_outlined,
                    color: Colors.red,
                    size: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "page_not_found".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "page_name".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${settings.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
