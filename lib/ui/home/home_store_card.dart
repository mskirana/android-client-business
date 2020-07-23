import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mskirana_app/common/selectable.dart';

class HomeStoreCard extends Selectable {
  final String storeName, distance, type, about;

  HomeStoreCard(
      {@required int idx,
      bool selected,
      Function(int idx) notifyParent,
      this.storeName,
      this.distance,
      this.type,
      this.about})
      : super(idx: idx, selected: selected, notifyParent: notifyParent);

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        width: double.maxFinite,
        child: GestureDetector(
            onTap: () {
              super.notifyParent(super.selected ? -1 : super.idx);
            },
            child: Card(
                color: (super.selected) ? Colors.grey[300] : Colors.white,
                child: Column(children: <Widget>[
                  ListTile(
                      title: Text(storeName,
                          style: GoogleFonts.openSans(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      subtitle: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(type,
                              style: GoogleFonts.openSans(
                                  fontSize: 14, color: Colors.grey))),
                      trailing: Column(children: <Widget>[
                        Text(distance,
                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.grey)),
                        if (!super.selected)
                          Text("More Info",
                              style: GoogleFonts.openSans(
                                  fontSize: 18, color: Colors.blue)),
                      ])),
                  if (super.selected)
                    Padding(
                        padding: EdgeInsets.only(left: 16, right:8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(about,
                                style: GoogleFonts.openSans(fontSize: 14)))),
                  if (super.selected)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              icon: new Icon(MdiIcons.phoneOutline,
                                  size: 24, color: Colors.blue),
                              onPressed: () {}),
                          Text(
                            "Call " + storeName,
                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.blue),
                          )
                        ]),
                ]))));
  }
}
