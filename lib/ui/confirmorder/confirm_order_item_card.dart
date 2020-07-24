import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmOrderItemCardState extends State<ConfirmOrderItemCard> {
  bool showAddItem = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  Widget _itemToList(loadElement) {
    return Container(
      height: 30,
      margin: EdgeInsets.fromLTRB(0,0,0,20),
      child : ListTile(
        title: Text(loadElement['title'],
            style: GoogleFonts.openSans(
                fontSize: 16, fontWeight: FontWeight.bold)),
        trailing: Text(loadElement['quantity'],
            style: GoogleFonts.openSans(fontSize: 12, color: Colors.grey))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3),
        width: double.maxFinite,
        child: Column(children: widget.productsList
                  .map((element) => Card(
                        child: _itemToList(element),
                      ))
                  .toList()));
  }
}

class ConfirmOrderItemCard extends StatefulWidget {
  final List<dynamic> productsList;
  ConfirmOrderItemCard({@required this.productsList});

  @override
  ConfirmOrderItemCardState createState() => ConfirmOrderItemCardState();
}
