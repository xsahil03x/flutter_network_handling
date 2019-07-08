import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_handling/di/app_module.dart';

import 'di/app_component.dart';

void main() async {
  var container = await AppComponent.create(AppModule());
  runApp(container.app);
}
