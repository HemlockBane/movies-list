import 'package:flutter/material.dart';
import 'package:movies_list_app/src/widgets/bottom_app_bar.dart';


class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}
class _MyHomeScreenState extends State<MyHomeScreen> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        onTabSelected: _changeTab,
        items: [
          AppBottomNavigationBarItem(iconData: Icons.whatshot, text: 'All'),
          AppBottomNavigationBarItem(iconData: Icons.star, text: 'Favourites'),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }


  void _changeTab(int nextTabIndex) {
    setState(() {
      _currentTabIndex = nextTabIndex;
    });
  }
}
