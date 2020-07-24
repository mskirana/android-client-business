import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mskirana_app/ui/common/shared_bottom_bar_item.dart';

enum SharedBottomBarEnum { home, tracking, account }

class SharedBottomBar extends StatelessWidget {
  final SharedBottomBarEnum selection;

  final items = [
    {
      "id": SharedBottomBarEnum.home,
      "iconData": MdiIcons.storeOutline,
      "link": "/home"
    },
    {
      "id": SharedBottomBarEnum.tracking,
      "iconData": MdiIcons.cartOutline,
      "link": "/tracking"
    },
    {
      "id": SharedBottomBarEnum.account,
      "iconData": MdiIcons.accountOutline,
      "link": "/account"
    }
  ];

  SharedBottomBar(this.selection);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(36, 0, 36, 18),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: () {
              var itemList = List<Widget>();
              items.asMap().forEach((index, value) {
                itemList.add(SharedBottomBarItem(
                    iconData: items[index]["iconData"],
                    selected: items[index]["id"] == selection,
                    link: items[index]["link"]));
              });
              return itemList;
            }()));
  }
}
