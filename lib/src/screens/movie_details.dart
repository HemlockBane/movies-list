import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_list_app/src/constants/strings.dart';
import 'package:movies_list_app/src/models/movie.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = 'movie_details';

  final Movie movie;

  MovieDetailsScreen({this.movie});

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 200,
                      child: Image.network(Strings.flutterTestImage, fit: BoxFit.fill,),
                    ),
                  )
                ],
              ),
              Text(widget.movie.title),
              Text(widget.movie.voteAverage.toString()),
              Text(widget.movie.releaseDate.toIso8601String()),
              Text(widget.movie.overView)
            ],
          ),
        ),
      ),
    );
  }
}
