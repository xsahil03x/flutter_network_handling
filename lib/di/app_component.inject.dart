import 'app_component.dart' as _i1;
import 'app_module.dart' as _i2;
import '../api_base_helper.dart' as _i3;
import '../movie_repository.dart' as _i4;
import '../movie_bloc.dart' as _i5;
import 'dart:async' as _i6;
import '../my_app.dart' as _i7;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._appModule);

  final _i2.AppModule _appModule;

  _i3.ApiBaseHelper _singletonApiBaseHelper;

  _i4.MovieRepository _singletonMovieRepository;

  _i5.MovieBloc _singletonMovieBloc;

  static _i6.Future<_i1.AppComponent> create(_i2.AppModule appModule) async {
    final injector = AppComponent$Injector._(appModule);

    return injector;
  }

  _i7.MyApp _createMyApp() => _i7.MyApp(_createMovieBloc());
  _i5.MovieBloc _createMovieBloc() => _singletonMovieBloc ??=
      _appModule.provideMovieBloc(_createMovieRepository());
  _i4.MovieRepository _createMovieRepository() => _singletonMovieRepository ??=
      _appModule.provideMovieRepository(_createApiBaseHelper());
  _i3.ApiBaseHelper _createApiBaseHelper() =>
      _singletonApiBaseHelper ??= _appModule.provideApiBaseHelper();
  @override
  _i7.MyApp get app => _createMyApp();
}
