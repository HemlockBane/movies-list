import 'package:flutter/material.dart';
import 'package:movies_list_app/src/models/movie.dart';
import 'package:movies_list_app/src/widgets/movie_card.dart';

class PopularMoviesScreen extends StatefulWidget {
  @override
  _PopularMoviesScreenState createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: getDummyMovies().length,
          itemBuilder: (context, itemIndex){
            final dummyMovie = getDummyMovies()[itemIndex];
          return MovieCard(movie: dummyMovie,);
        }),
      ),
    );
  }
}
