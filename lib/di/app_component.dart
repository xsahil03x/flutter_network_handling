import 'package:inject/inject.dart';
import 'package:network_handling/di/app_module.dart';
import '../my_app.dart';
import 'app_component.inject.dart' as G;

@Injector(const [AppModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static final create = G.AppComponent$Injector.create;
}
