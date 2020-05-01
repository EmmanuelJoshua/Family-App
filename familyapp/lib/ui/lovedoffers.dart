import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../theme.dart';

class LovedOffers extends StatefulWidget {
  @override
  _LovedOffersState createState() => _LovedOffersState();
}

class _LovedOffersState extends State<LovedOffers> {
  //Declaration of Lists to hold data content of special offers
  final List<String> categories = ['Freebies', 'Offers', 'Contests', 'Others'];

  final List<String> offers = [
    'Vegan Fries',
    'PS3 Gamepad',
    'Vegan Pizza',
    '\$100 Cash'
  ];

  final List<String> offersFamily = [
    'James\'s Family',
    'Isaac\'s Son',
    'Brian\'s Family',
    'Morgan\'s Baby'
  ];

  final List<IconData> offersIcons = [
    Icons.fastfood,
    Icons.gamepad,
    Icons.fastfood,
    Icons.attach_money
  ];

  //Index for top selection
  int selectedindex = 0;

  //button color for the top selection
  Color buttonColor = categoriesColor[0];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

        //Sticky Header implementation
        child: StickyHeader(

            //Header container with top selection
            header: Container(
                color: Colors.white,
                height: 56,

                //Listview builder for top selection buttons
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 6, bottom: 8),
                        child: SizedBox(
                          width: 82,
                          child: FlatButton(
                            child: Text(categories[index],
                                style: TextStyle(
                                    fontSize: 13.5,
                                    color: selectedindex == index
                                        ? Colors.white
                                        : categoriesColor[index],
                                    fontFamily: 'PTsans',
                                    fontWeight: FontWeight.w600)),
                            onPressed: () {
                              setState(() {
                                selectedindex = index;
                                buttonColor = categoriesColor[index];
                              });
                            },
                            color: selectedindex == index
                                ? buttonColor
                                : buttonHeader,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      );
                    })),

            //Main content
            content: Column(
              children: <Widget>[
                Container(
                  height: 550,
                  width: double.infinity,

                  //Listview builder for loved offers
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: 18, right: 18, bottom: 6, top: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F9FA),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Color(0xFFD9FBFD),
                              child: Icon(
                                offersIcons[index],
                                color: buttonColor,
                                size: 18,
                              ),
                            ),
                            title: Text(offers[index],
                                style: TextStyle(
                                    fontFamily: 'PTSans',
                                    fontSize: 14,
                                    color: primaryText,
                                    fontWeight: FontWeight.w600)),
                            subtitle: Text(offersFamily[index],
                                style: TextStyle(
                                    fontFamily: 'PTSans',
                                    fontSize: 13,
                                    color: Color(0xFFC2CDCC),
                                    fontWeight: FontWeight.w600)),
                          ),
                        );
                      }),
                )
              ],
            )));
  }
}
