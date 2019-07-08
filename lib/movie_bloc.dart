import 'dart:async';

import 'package:inject/inject.dart';
import 'package:network_handling/api_response.dart';
import 'package:network_handling/movie_repository.dart';

import 'movie_response.dart';

class MovieBloc {
  final MovieRepository _movieRepository;

  StreamController _movieListController;

  StreamSink<ApiResponse<List<Movie>>> get movieListSink =>
      _movieListController.sink;

  Stream<ApiResponse<List<Movie>>> get movieListStream =>
      _movieListController.stream;

  @provide
  MovieBloc(this._movieRepository);

  init() {
    _movieListController = StreamController<ApiResponse<List<Movie>>>();
    fetchMovieList();
  }

  fetchMovieList() async {
    movieListSink.add(ApiResponse.loading('Fetching Popular Movies'));
    try {
      List<Movie> movies = await _movieRepository.fetchMovieList();
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieListController?.close();
  }
}
