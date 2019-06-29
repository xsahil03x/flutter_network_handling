import 'dart:async';

import 'package:network_handling/api_response.dart';
import 'package:network_handling/movie_repository.dart';

import 'movie_response.dart';

class MovieBloc {
  MovieRepository _movieRepository;

  StreamController _movieListController;

  StreamSink<ApiResponse<List<Movie>>> get movieListSink =>
      _movieListController.sink;

  Stream<ApiResponse<List<Movie>>> get movieListStream =>
      _movieListController.stream;

  MovieBloc() {
    _movieListController = StreamController<ApiResponse<List<Movie>>>();
    _movieRepository = MovieRepository();
    fetchMovieList();
  }

  fetchMovieList() async {
    movieListSink.add(ApiResponse.loading());
    try {
      List<Movie> movies = await _movieRepository.fetchMovieList();
      movieListSink.add(ApiResponse.completed(data: movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(message: e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieListController?.close();
  }
}
