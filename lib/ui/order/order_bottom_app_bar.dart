import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OrderBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(36, 0, 36, 18),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                  icon: new Icon(MdiIcons.storeOutline,
                      size: 36, color: Colors.purple[200]),
                  onPressed: () {}),
              IconButton(
                  icon: new Icon(MdiIcons.cartOutline,
                      size: 36, color: Colors.grey),
                  onPressed: () {}),
              IconButton(
                  icon: new Icon(MdiIcons.accountOutline,
                      size: 36, color: Colors.grey),
                  onPressed: () {}),
            ]));
  }
}
