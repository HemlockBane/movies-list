import 'package:flutter/material.dart';

class FavouriteMoviesScreen extends StatefulWidget {
  @override
  _FavouriteMoviesScreenState createState() => _FavouriteMoviesScreenState();
}

class _FavouriteMoviesScreenState extends State<FavouriteMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Movies'),
      ),
      body: Container(
        child: Center(child: Text('Favourites')),
      ),
    );
  }
}
