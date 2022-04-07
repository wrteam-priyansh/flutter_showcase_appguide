import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcase_app/screens/homeScreen.dart';
import 'package:showcase_app/screens/notesScreen.dart';
import 'package:showcase_app/screens/splashScreen.dart';

class Routes {
  static String home = "/";
  static String splash = "splash";

  static String notes = "notes";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == home) {
      return HomeScreen.route(routeSettings);
    }
    if (routeSettings.name == splash) {
      return CupertinoPageRoute(builder: (_) => SplashScreen());
    }
    if (routeSettings.name == notes) {
      return NotesScreen.route(routeSettings);
    }
    return CupertinoPageRoute(builder: (_) => Scaffold());
  }
}
