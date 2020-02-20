import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AppNotifier with ChangeNotifier{
  static AppNotifier of(BuildContext context) =>
    Provider.of<AppNotifier>(context, listen: false);

  int _selectedTabItemIndex = 0;

  int get selectedTabItemIndex => _selectedTabItemIndex;



  void handleTabItemPress(int selectedTabIndex) {
    _selectedTabItemIndex = selectedTabIndex;
    notifyListeners();
  }
}