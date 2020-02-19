import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_list_app/src/models/movie.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  
  MovieCard({this.movie});
  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        child: Row(
          children: <Widget>[
            _buildImage(),
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
                            Text('Movie Name'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('Year & Time'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('7.8'),
                        IconButton(icon: Icon(Icons.star_border), onPressed: (){})
                      ],
                    )
                  ],
                ),

            ))
          ],
        ),
      ),
    );
  }

  Widget _buildImage({String imagePath}){
    final flutterTestImage = 'https://picsum.photos/250?image=9';
    final testImagePath = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fithemes.com%2Ffree-high-quality-images%2F&psig=AOvVaw1Qzmj7Yze1OJBlwn2JcXO6&ust=1582186986947000&source=images&cd=vfe&ved=2ahUKEwjYyu_7l93nAhUPghoKHTWnBcQQr4kDegUIARCEAg';
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(flutterTestImage),
          fit: BoxFit.cover
        )
      ),
    );
  }
  
}
