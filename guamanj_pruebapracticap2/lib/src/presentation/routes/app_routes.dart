import 'package:flutter/material.dart';
import '../views/home_page.dart';

class AppRoutes {
  static const String home = '/';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomePage(),
    };
  }
}
