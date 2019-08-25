import 'package:flutter/material.dart';

import 'movie_bloc.dart';

class DummyClass extends StatelessWidget {
  final MovieBloc bloc;
  final String movieName;

  const DummyClass({Key key, this.bloc, this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dummy"),),
      body: Center(
        child:Text(movieName??"Dummy"),
      ),
    );
  }
}
