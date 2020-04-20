import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../theme.dart';

class LovedOffers extends StatefulWidget {
  @override
  _LovedOffersState createState() => _LovedOffersState();
}

class _LovedOffersState extends State<LovedOffers> {
  final List<String> categories = ['Freebies', 'Offers', 'Contests', 'Others'];

  int selectedindex = 0;

  Color buttonColor = categoriesColor[0];

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: StickyHeader(
            header: Container(
                color: Colors.white,
                height: 56,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 6, bottom: 6),
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
            content: Column(
              children: <Widget>[
                Container(
                  height: 550,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(left: 15, right: 15, bottom: 6, top: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F9FA),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Color(0xFFD9FBFD),
                              child: Icon(
                                Icons.gamepad,
                                color: buttonColor,
                                size: 18,
                              ),
                            ),
                            title: Text('PS3 Gamepad',
                                style: TextStyle(
                                    fontFamily: 'PTSans',
                                    fontSize: 14,
                                    color: primaryText,
                                    fontWeight: FontWeight.w600)),
                            subtitle: Text('James\'s Family',
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
