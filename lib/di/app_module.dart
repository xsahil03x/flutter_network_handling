import 'package:inject/inject.dart';
import '../api_base_helper.dart';
import '../movie_bloc.dart';
import '../movie_repository.dart';

@module
class AppModule {
  @provide
  @singleton
  ApiBaseHelper provideApiBaseHelper() => ApiBaseHelper();

  @provide
  @singleton
  MovieRepository provideMovieRepository(ApiBaseHelper helper) =>
      MovieRepository(helper);

  @provide
  @singleton
  MovieBloc provideMovieBloc(MovieRepository repository) =>
      MovieBloc(repository);
}
