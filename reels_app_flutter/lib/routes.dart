import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case ShippingListingScreen.routeName:
      //   return MaterialPageRoute(builder: (context) => const ShippingListingScreen(), settings: settings);

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
