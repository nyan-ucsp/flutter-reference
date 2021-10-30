import 'package:flutter_reference/services/theme_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class StaticList {
  static List<SingleChildWidget> providerList = <SingleChildWidget>[
    ChangeNotifierProvider(
      create: (_) => ThemeService(),
    ),
  ];
}
