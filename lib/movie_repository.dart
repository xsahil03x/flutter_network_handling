import 'package:network_handling/api_base_helper.dart';
import 'package:network_handling/movie_response.dart';

class MovieRepository {
  final String _apiKey = "Add your api key here";

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Movie>> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
}
