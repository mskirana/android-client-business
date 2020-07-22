import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/home/home_store_card.dart';
import 'package:mskirana_app/ui/home/home_store_category.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStoreView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeStoreViewState();
}

class HomeStoreViewState extends State<HomeStoreView> {
  int selected = -1;

  final categories = ["Grocery", "Snacks", "Chemist", "Bakery"];

  final stores = [
    {
      "storeName": "Vijay Stores",
      "distance": "0.7KM",
      "type": "Grocery and general store",
      "about":
          "Some products sold here are plastic items, toiletries, vegetables, fruits, rice, flour, biscuits, instant food, etc."
    },
    {
      "storeName": "Bharat Stores",
      "distance": "1.1KM",
      "type": "Chemist and general store",
      "about":
          "Some products sold here are allelopathy and homeopathy medicines, stationery, cold drinks, ice cream, etc."
    },
    {
      "storeName": "Komal Collection",
      "distance": "1.2KM",
      "type": "General store",
      "about":
          "Some products sold here are vegatables, fruits, rice, cooking oils, biscuits, tea, notebooks, pens, bulbs, batteries, etc."
    }
  ];

  void setSelected(int idx) {
    setState(() {
      selected = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          /** this is a hack to get alternate selected categories */
          children: () {
            var cards = new List<Widget>();
            categories.asMap().forEach((index, value) =>
                cards.add(HomeStoreCategory(value, index % 2 == 0)));
            return cards.toList();
          }()),
      Expanded(
          child: ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) {
                return HomeStoreCard(
                    idx: index,
                    storeName: stores[index]["storeName"],
                    distance: stores[index]["distance"],
                    type: stores[index]["type"],
                    about: stores[index]["about"],
                    selected: index == selected,
                    notifyParent: setSelected);
              })),
      // show the next button if something is selected
      if (selected > -1)
        Center(
            child: ButtonTheme(
                minWidth: 50,
                height: 20,
                padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/order');
                    },
                    color: Color(0XFF9378FF),
                    child: Text('Next',
                        style: GoogleFonts.openSans(
                            color: Colors.white, fontSize: 24)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)))))
    ]);
  }
}
