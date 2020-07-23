import 'package:flutter/material.dart';

class SharedBottomBarItem extends StatelessWidget {
  final IconData iconData;
  final bool selected;
  final String link;

  SharedBottomBarItem({@required this.iconData, this.selected, this.link});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: new Icon(iconData,
            size: 36, color: (selected) ? Colors.purple[200] : Colors.grey),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(link);
        });
  }
}
