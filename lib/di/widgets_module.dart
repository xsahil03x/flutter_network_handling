import 'package:inject/inject.dart';

import '../dummy_class.dart';
import '../movie_bloc.dart';
import '../my_app.dart';

@module
class WidgetsModule {
  @provide
  MovieScreen provideMovieScreen(MovieBloc movieBloc) =>
      MovieScreen(bloc: movieBloc);

  @provide
  DummyClass provideDummy(MovieBloc movieBloc) => DummyClass(bloc: movieBloc);
}
