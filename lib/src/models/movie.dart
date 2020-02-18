class Movie {
  int id = 0;
  String title = '';
  String originalTitle = '';
  DateTime releaseDate;
  int voteAverage = 0;
  String originalLanguage = '';
  String posterPath = '';
  String backdropPath = '';
  double popularity = 0.0;
  bool isAdult = false;
  bool isFavourite = false;

  Movie.fromMap(Map json){}


  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = Map();


    return map;
  }

}
