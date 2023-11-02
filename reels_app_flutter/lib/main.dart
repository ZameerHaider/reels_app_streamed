import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:reels_app_flutter/routes.dart';
import 'package:reels_app_flutter/theme/theme_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Reels App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: "/",
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
    );
  }
}
