import 'dart:convert';
import 'dart:developer';

import 'package:movies_list_app/src/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movies_list_app/api_keys/api_keys.dart';

class ApiService{
  http.Client _httpClient = http.Client();
  final url = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey';



  Future<List<Movie>> getMovies()async{
    http.Response response;
    List<Movie> movies = [];
    try {
      response = await _httpClient.get(url);
    }
    catch (e) {
      print(e);
    }finally{
      _httpClient.close();
    }

    if(response.statusCode != 200){

    }


    if(response.statusCode == 200){
      final jsonString = response.body;
      final json = jsonDecode(jsonString);
      final moviesList = json['results'] as List;
      log(moviesList[0].toString());
      //log(json.toString());
    }


    return movies;
  }
}