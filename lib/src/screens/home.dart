import 'package:flutter/material.dart';
import 'package:movies_list_app/src/notifiers/app_notifier.dart';
import 'package:movies_list_app/src/widgets/bottom_app_bar.dart';
import 'package:provider/provider.dart';


class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}
class _MyHomeScreenState extends State<MyHomeScreen> {


  var texts = [0, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: Consumer<AppNotifier>(
        builder: (context, appNotifier, _){
          return AppBottomNavigationBar(
            selectedItemIndex: appNotifier.selectedTabItemIndex,
            items: [
              AppBottomNavigationBarItem(iconData: Icons.whatshot, text: 'All'),
              AppBottomNavigationBarItem(iconData: Icons.star, text: 'Favourites'),
            ],
          );
        },
      ),
      body: Consumer<AppNotifier>(
        builder: (context, appNotifier, _){
          return Center(
            child: Text('Page ${texts[appNotifier.selectedTabItemIndex]}')
          );
        },
      ),
    );
  }
  
}
