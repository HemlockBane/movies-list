import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_list_app/src/constants/strings.dart';
import 'package:movies_list_app/src/models/movie.dart';
import 'package:movies_list_app/src/notifiers/popular_movies_notifier.dart';
import 'package:movies_list_app/src/services/format_service.dart';
import 'package:provider/provider.dart';

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
                      height: 400,
                      child: Image.network(Strings.basePictureUrl+widget.movie.posterPath, fit: BoxFit.fill,),
                    ),
                  )
                ],
              ),
              Text(widget.movie.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
                ),
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(5.0),
                child: Text(widget.movie.voteAverage.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),

              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(FormatService.formatDateOnly(widget.movie.releaseDate), style: TextStyle(fontSize: 13),)
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(widget.movie.overView)
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          PopularMoviesNotifier.of(context).toggleFavourite(movie: widget.movie);
        },
        child: Consumer<PopularMoviesNotifier>(
          builder: (context, moviesNotifier, _){
            //print(widget.movie.isFavourite.toString());
            return Icon(widget.movie.isFavourite ? Icons.star : Icons.star_border);
          },

        ),
        ),
    );
  }
}
