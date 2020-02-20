import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movies_list_app/src/models/movie.dart';
import 'package:movies_list_app/src/notifiers/popular_movies_notifier.dart';
import 'package:movies_list_app/src/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class PopularMoviesScreen extends StatefulWidget {
  @override
  _PopularMoviesScreenState createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      PopularMoviesNotifier.of(context).getMovies();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Container(
        child: Consumer<PopularMoviesNotifier>(
          builder: (context, moviesNotifier, _){
            if(moviesNotifier.isLoadingMovies){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: moviesNotifier.allMovies.length,
              itemBuilder: (context, itemIndex){
                final dummyMovie = moviesNotifier.allMovies[itemIndex];
                return MovieCard(movie: dummyMovie,);
              });
          },
        ),
      ),
    );
  }
}
