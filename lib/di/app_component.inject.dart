import 'app_component.dart' as _i1;
import 'widgets_module.dart' as _i2;
import 'app_module.dart' as _i3;
import '../api_base_helper.dart' as _i4;
import '../movie_repository.dart' as _i5;
import '../movie_bloc.dart' as _i6;
import 'dart:async' as _i7;
import '../my_app.dart' as _i8;
import '../routes.dart' as _i9;
import '../dummy_class.dart' as _i10;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._widgetsModule, this._appModule);

  final _i2.WidgetsModule _widgetsModule;

  final _i3.AppModule _appModule;

  _i4.ApiBaseHelper _singletonApiBaseHelper;

  _i5.MovieRepository _singletonMovieRepository;

  _i6.MovieBloc _singletonMovieBloc;

  static _i7.Future<_i1.AppComponent> create(
      _i3.AppModule appModule, _i2.WidgetsModule widgetsModule) async {
    final injector = AppComponent$Injector._(widgetsModule, appModule);

    return injector;
  }

  _i8.MyApp _createMyApp() => _i8.MyApp(_createRouter());
  _i9.Router _createRouter() =>
      _i9.Router(_createMovieScreen, _createDummyClass);
  _i8.MovieScreen _createMovieScreen() =>
      _widgetsModule.provideMovieScreen(_createMovieBloc());
  _i6.MovieBloc _createMovieBloc() => _singletonMovieBloc ??=
      _appModule.provideMovieBloc(_createMovieRepository());
  _i5.MovieRepository _createMovieRepository() => _singletonMovieRepository ??=
      _appModule.provideMovieRepository(_createApiBaseHelper());
  _i4.ApiBaseHelper _createApiBaseHelper() =>
      _singletonApiBaseHelper ??= _appModule.provideApiBaseHelper();
  _i10.DummyClass _createDummyClass() =>
      _widgetsModule.provideDummy(_createMovieBloc());
  @override
  _i8.MyApp get app => _createMyApp();
}
