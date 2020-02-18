import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_list_app/src/notifiers/app_notifier.dart';


class AppBottomNavigationBarItem {
  AppBottomNavigationBarItem({this.iconData, this.text});

  IconData iconData;
  String text;
}

class AppBottomNavigationBar extends StatefulWidget {
  final List <AppBottomNavigationBarItem> items;
  final Color color;
  final Color selectedColor;
  final double height;
  final double iconSize;
  final int selectedItemIndex;


  const AppBottomNavigationBar(
    {this.selectedItemIndex, this.items, this.color = Colors.grey, this.selectedColor = Colors.black, this.height = 60, this.iconSize = 24});

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _items(),
      ),
    );
  }

  List<Widget> _items() {
    return List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        navigationBarItem: widget.items[index],
        index: index,
        onPressed: _updateSelectedItemIndex
      );
    });
  }

  Widget _buildTabItem(
    {AppBottomNavigationBarItem navigationBarItem, int index, ValueChanged<int> onPressed}) {
    Color color = widget.selectedItemIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(navigationBarItem.iconData, color: color, size: widget.iconSize,),
                Text(navigationBarItem.text, style: TextStyle(
                  color: color
                ),)
              ],
            ),
          ),
        ),
      )
    );
  }

  _updateSelectedItemIndex(int newSelectedItemIndex) {
  AppNotifier.of(context).handleTabItemPress(newSelectedItemIndex);
  }
}
