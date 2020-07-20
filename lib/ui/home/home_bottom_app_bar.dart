import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(36, 0, 36, 18),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                  icon: new Icon(MdiIcons.storeOutline, size: 36),
                  onPressed: () {}),
              IconButton(
                  icon: new Icon(MdiIcons.cart, size: 36), onPressed: () {}),
              IconButton(
                  icon: new Icon(MdiIcons.account, size: 36), onPressed: () {}),
            ]));
  }
}
