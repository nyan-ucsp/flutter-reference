import 'package:animate_do/animate_do.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_reference/services/navigation_service.dart';
import 'package:flutter_reference/views/utils/no_internet_connection_screen.dart';

class UtilsWidget {
  //Default Widget With Static
  static Text defaultText(data,
          {Key? key,
          TextStyle? style,
          StrutStyle? strutStyle,
          TextAlign? textAlign,
          Locale? locale,
          bool? softWrap,
          TextOverflow? overflow,
          double? textScaleFactor,
          int? maxLines,
          String? semanticsLabel,
          TextWidthBasis? textWidthBasis,
          TextHeightBehavior? textHeightBehavior}) =>
      Text(
        data,
        key: key,
        style: style ?? TextStyle(height: 1.3),
        strutStyle: strutStyle ??
            StrutStyle(
              height: 1.3,
              fontSize: style?.fontSize,
            ),
        textAlign: textAlign,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );

  static PreferredSizeWidget scrollToHideAppBar({
    required Widget child,
    required ScrollController controller,
    Duration duration = const Duration(milliseconds: 200),
  }) =>
      PreferredSize(
        child: ScrollToHideWidget(child: child, controller: controller),
        preferredSize: Size.fromHeight(kToolbarHeight),
      );

  static Widget scrollToHide({
    required Widget child,
    required ScrollController controller,
    Duration duration = const Duration(milliseconds: 200),
  }) =>
      ScrollToHideWidget(
        child: child,
        controller: controller,
        duration: duration,
      );

  static Widget loading() {
    return Roulette(
      infinite: true,
      duration: Duration(seconds: 3),
      delay: Duration(milliseconds: 1500),
      child: SpinPerfect(
        duration: Duration(seconds: 4),
        delay: Duration(seconds: 2),
        infinite: true,
        child: Stack(
          children: [
            Stack(
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: Bounce(
                    infinite: true,
                    from: 16,
                    duration: Duration(seconds: 1),
                    delay: Duration(milliseconds: 500),
                    child: Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 16,
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 0,
                  child: Bounce(
                    from: 16,
                    duration: Duration(seconds: 1),
                    delay: Duration(milliseconds: 500),
                    infinite: true,
                    child: Icon(
                      Icons.circle,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Bounce(
                    infinite: true,
                    from: 16,
                    duration: Duration(seconds: 1),
                    delay: Duration(milliseconds: 500),
                    child: Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 16,
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Bounce(
                    from: 16,
                    duration: Duration(seconds: 1),
                    delay: Duration(milliseconds: 500),
                    infinite: true,
                    child: Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget noInterentConnection({required Function() tapToRetry}) =>
      NoInternetConnection(tapToRetry: tapToRetry);
  static Widget somethingWasWrong({required Function() tapToRetry}) =>
      SomethingWasWrong(tapToRetry: tapToRetry);
  static Widget fileLinkBroken(
          {required Function() onTap, required buttonText}) =>
      FileLinkBroken(
        onTap: onTap,
        buttonText: buttonText,
      );

  static void showSaveLoading({Widget? customTextWidget}) =>
      BotToast.showCustomLoading(
        align: Alignment.center,
        toastBuilder: (cancelFunc) {
          return Flash(
            infinite: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.save),
                SizedBox(
                  height: 4,
                ),
                customTextWidget ?? Text('saving').tr(),
              ],
            ),
          );
        },
      );
}

class NoInternetConnection extends StatelessWidget {
  final Function() tapToRetry;
  const NoInternetConnection({Key? key, required this.tapToRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'resources/images/wi-fi-disconnected-96.png',
          width: 75,
          height: 75,
        ),
        SizedBox(
          height: 8,
        ),
        UtilsWidget.defaultText('no_internet_connection').tr(),
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () {
            NavigationService.navigateTo(NoInternetConnectionScreen.routeName);
          },
          child: UtilsWidget.defaultText(
            'Check_the_solution',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ).tr(),
        ),
        SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: tapToRetry,
          child: UtilsWidget.defaultText('TAP_TO_RETRY').tr(),
          style: ElevatedButton.styleFrom(shape: StadiumBorder()),
        )
      ],
    );
  }
}

class FileLinkBroken extends StatelessWidget {
  final Function() onTap;
  final String buttonText;
  const FileLinkBroken(
      {Key? key, required this.onTap, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'resources/images/broken-link-96.png',
          width: 50,
          height: 50,
        ),
        SizedBox(
          height: 8,
        ),
        UtilsWidget.defaultText('Failed_to_load_resource').tr(),
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () {
            NavigationService.navigateTo(NoInternetConnectionScreen.routeName);
          },
          child: UtilsWidget.defaultText(
            'Help_and_report_to_customer_support',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ).tr(),
        ),
        SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: onTap,
          child: UtilsWidget.defaultText(buttonText).tr(),
          style: ElevatedButton.styleFrom(shape: StadiumBorder()),
        )
      ],
    );
  }
}

class SomethingWasWrong extends StatelessWidget {
  final Function() tapToRetry;
  const SomethingWasWrong({Key? key, required this.tapToRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'resources/images/gps-disconnected-96.png',
          width: 75,
          height: 75,
        ),
        SizedBox(
          height: 8,
        ),
        UtilsWidget.defaultText('Something_was_wrong').tr(),
        SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: tapToRetry,
          child: UtilsWidget.defaultText('TAP_TO_RETRY').tr(),
          style: ElevatedButton.styleFrom(shape: StadiumBorder()),
        )
      ],
    );
  }
}

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  const ScrollToHideWidget({
    Key? key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: widget.duration,
        height: isVisible ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          children: [
            widget.child,
          ],
        ),
      );
}

class ArkNetworkImage extends StatelessWidget {
  final String url;
  const ArkNetworkImage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image.network(url);
    } else {
      return CachedNetworkImage(imageUrl: url);
    }
  }
}
