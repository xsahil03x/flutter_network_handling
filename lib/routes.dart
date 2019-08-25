import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

import 'di/app_component.dart';
import 'dummy_class.dart';
import 'my_app.dart';

@provide
class Router {
  final Provider<MovieScreen> _movieScreen;
  final Provider<DummyClass> _dummyPage;

  Router(this._movieScreen, this._dummyPage);

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => _movieScreen());
      case '/dummyClass':
        return MaterialPageRoute(builder: (_) => _dummyPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
