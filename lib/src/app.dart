import 'package:flutter/material.dart';
import 'package:movies_list_app/src/notifiers/popular_movies_notifier.dart';
import 'package:movies_list_app/src/screens/home.dart';
import 'package:movies_list_app/src/screens/movie_details.dart';
import 'package:provider/provider.dart';

import 'notifiers/app_notifier.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppNotifier()),
        ChangeNotifierProvider(create: (_) => PopularMoviesNotifier()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomeScreen(title: 'Flutter Demo Home Page'),
        routes: {
          MovieDetailsScreen.routeName: (BuildContext context) => MovieDetailsScreen()
        },
      ),
    );
  }
}
