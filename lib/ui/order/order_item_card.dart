import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItemCardState extends State<OrderItemCard> {
  var _products = [];
  List<dynamic> get products => _products;

  bool showAddItem = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  void addItemToList() {
    setState(() {
      if (nameController.text != '' && quantityController.text != '') {
        _products.add({
          'title': nameController.text,
          'quantity': quantityController.text,
          'isEdit': false
        });
        nameController.text = '';
        quantityController.text = '';
        showAddItem = false;
      }
    });
  }

  void deleteItemToList(deleteElement) {
    setState(() {
      _products.removeWhere((element) => element == deleteElement);
    });
  }

  void editItemToList(editElement) {
    setState(() {
      _products.forEach((element) {
        element['isEdit'] = false;
      });
      int index = _products.indexWhere((element) => element == editElement);
      _products[index]['isEdit'] = true;
    });
  }

  void _updateItemToList(title, quantity, oldElement) {
    setState(() {
      int index = _products.indexWhere((element) => element == oldElement);
      _products[index]['title'] = title;
      _products[index]['quantity'] = quantity;
      _products[index]['isEdit'] = false;
    });
  }

  Widget _itemToList(loadElement) {
    if (loadElement['isEdit']) {
      nameController = TextEditingController(text: loadElement['title']);
      quantityController = TextEditingController(text: loadElement['quantity']);
      return ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Item',
                ),
              )),
              Container(width: 16.0),
              Expanded(
                  child: TextField(
                controller: quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
              )),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.check),
            color: Colors.green,
            iconSize: 30,
            onPressed: () {
              _updateItemToList(
                  nameController.text, quantityController.text, loadElement);
            },
          ));
    } else {
      return ListTile(
        title: Row(
          children: <Widget>[
            Container(
                width: 150,
                child: Text(loadElement['title'],
                    style: GoogleFonts.openSans(
                        fontSize: 22, fontWeight: FontWeight.bold))),
            Container(
                width: 70,
                child: Text(loadElement['quantity'],
                    style: GoogleFonts.openSans(
                        fontSize: 18, color: Colors.grey))),
          ],
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              iconSize: 20,
              onPressed: () {
                editItemToList(loadElement);
              }),
          IconButton(
            icon: Icon(Icons.close),
            color: Colors.red,
            iconSize: 20,
            onPressed: () {
              deleteItemToList(loadElement);
            },
          )
        ]),
      );
    }
  }

  Widget _getAddItemWidget() {
    if (showAddItem) {
      return ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Item',
                ),
              )),
              Container(width: 16.0),
              Expanded(
                child: TextField(
                  controller: quantityController,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                  ),
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.check),
            color: Colors.green,
            iconSize: 30,
            onPressed: () {
              addItemToList();
            },
          ));
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        width: double.maxFinite,
        child: Column(children: [
          Column(
              children: _products
                  .map((element) => Card(
                        child: _itemToList(element),
                      ))
                  .toList()),
          Column(children: <Widget>[
            Padding(padding: EdgeInsets.all(5), child: _getAddItemWidget()),
            FlatButton.icon(
              icon: Icon(Icons.add_circle, color: Color(0XFF000AFF)),
              onPressed: () {
                setState(() {
                  showAddItem = true;
                });
              },
              label: Text('Add Another Item',
                  style: GoogleFonts.openSans(
                      color: Color(0XFF000AFF), fontSize: 24)),
            )
          ])
        ]));
  }
}

class OrderItemCard extends StatefulWidget {
  OrderItemCard({Key key}) : super(key: key);

  @override
  OrderItemCardState createState() => OrderItemCardState();
}
