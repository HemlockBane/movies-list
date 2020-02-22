import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_list_app/src/constants/strings.dart';
import 'package:movies_list_app/src/models/movie.dart';
import 'package:movies_list_app/src/notifiers/popular_movies_notifier.dart';
import 'package:movies_list_app/src/screens/movie_details.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;

  MovieCard({this.movie});
  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return MovieDetailsScreen(movie: widget.movie,);
        }));
      },
      child: Container(
        height: 150,
        child: Card(
          child: Row(
            children: <Widget>[
              _buildImage(imagePath: widget.movie.posterPath),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(child: Text(widget.movie.title)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(widget.movie.releaseDate?.toIso8601String() ?? ' '),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(widget.movie.voteAverage.toString()),
//                          Consumer<PopularMoviesNotifier>(
//                            builder: (context, movieNotifier, _){
//                              return IconButton(
//                                icon: Icon(widget.movie.isFavourite ? Icons.star : Icons.star_border),
//                                onPressed: (){
//                                  PopularMoviesNotifier.of(context).toggleFavourite(movie: widget.movie);
//                                }
//                              );
//                            },
//                          )
                        ],
                      )
                    ],
                  ),

              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage({String imagePath}){
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(Strings.basePictureUrl+imagePath),
          fit: BoxFit.cover
        )
      ),
    );
  }

}
