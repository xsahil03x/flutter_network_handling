import 'package:inject/inject.dart';
import 'package:network_handling/di/app_module.dart';
import '../my_app.dart';
import 'app_component.inject.dart' as g;
import 'widgets_module.dart';

@Injector(const [AppModule, WidgetsModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create(
    AppModule appModule,
    WidgetsModule widgetsModule,
  ) async {
    return await g.AppComponent$Injector.create(
      appModule,
      widgetsModule,
    );
  }
}

typedef Provider<T> = T Function();
