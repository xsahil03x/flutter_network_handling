import 'package:inject/inject.dart';
import 'package:network_handling/api_base_helper.dart';
import 'package:network_handling/movie_response.dart';

class MovieRepository {
  final String _apiKey = "78b9f63937763a206bff26c070b94158";

  final ApiBaseHelper _helper;

  @provide
  MovieRepository(this._helper);

  Future<List<Movie>> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
}
