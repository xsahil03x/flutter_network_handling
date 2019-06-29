import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_handling/api_response.dart';
import 'package:network_handling/movie_bloc.dart';

import 'movie_response.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Network Handling Demo',
      home: MovieScreen(),
    );
  }
}

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  MovieBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = MovieBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Movie Mania',
            style: TextStyle(color: Color(0xff7cb342), fontSize: 28)),
        backgroundColor: Color(0xff171717),
      ),
      backgroundColor: Color(0xff171717),
      body: StreamBuilder<ApiResponse<List<Movie>>>(
        stream: _bloc.movieListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data.status) {
              case Status.LOADING:
                return Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff7cb342))),
                );
                break;
              case Status.COMPLETED:
                return MovieList(movieList: snapshot.data.data);
                break;
              case Status.ERROR:
                return Center(
                    child: RaisedButton(
                  color: Color(0xff7cb342),
                  child: Text('Retry', style: TextStyle(color: Colors.white)),
                  onPressed: () => _bloc.fetchMovieList(),
                ));
                break;
            }
          }
          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movieList;

  const MovieList({Key key, this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w342${movieList[index].posterPath}',
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
