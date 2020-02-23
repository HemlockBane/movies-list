import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_list_app/src/constants/strings.dart';
import 'package:movies_list_app/src/models/movie.dart';
import 'package:movies_list_app/src/notifiers/popular_movies_notifier.dart';
import 'package:movies_list_app/src/screens/movie_details.dart';
import 'package:movies_list_app/src/services/format_service.dart';
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
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Text(widget.movie.title,
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                                )
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(FormatService.formatDateOnly(widget.movie.releaseDate) ?? ' '),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(widget.movie.voteAverage.toString(), style: TextStyle(
                              color: Colors.white
                            ),),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black
                            ),
                            padding: EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
                          ),
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
