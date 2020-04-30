import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  int pageIndex = 1;

  PageController _pageController;
  PageController _pageController2;

  Color buttonColor = categoriesColor[0];

  final List<String> categories = ['Freebies', 'Offers', 'Contests', 'Others'];

  final List<bool> familyFollowed = [false, false, false];

  final List<String> imagesSpecial = [
    'assets/images/food_salad.jpg',
    'assets/images/chicken.jpg',
    'assets/images/fries.jpg',
    'assets/images/gamepad.jpg',
    'assets/images/healthy_breakfast.jpg',
    'assets/images/money.jpg',
    'assets/images/pizza.jpg',
    'assets/images/vegan.jpg',
  ];

  final List<String> imagesFamily = [
    'assets/images/baby.jpg',
    'assets/images/family.jpg',
    'assets/images/baby2.jpg',
  ];

  void followFamily(int index){
    if(familyFollowed[index] == false) familyFollowed[index] = true;
    else if(familyFollowed[index] == true) familyFollowed[index] = false;
  }

  @override
  void initState() {
    super.initState();
//    imageIndex = rand as int;
    _pageController = PageController(initialPage: 1, viewportFraction: 0.6);
    _pageController2 = PageController(initialPage: 1, viewportFraction: 0.6);
  }

  int _number = 0;
  void generateRandom() {
    final _random = new Random();
    int next(int min, int max) => min + _random.nextInt(max - min);
    setState(() {
      _number = next(0, imagesSpecial.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StickyHeader(
        header: Container(
          color: Colors.white,
          height: 56,
          padding: EdgeInsets.only(left: 6, bottom: 6),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    width: 83,
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
                          generateRandom();
                        });
                      },
                      color:
                          selectedindex == index ? buttonColor : buttonHeader,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                );
              }),
        ),
        content: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (int index) {
                  setState(() {
                    pageIndex = index;
                  });
                  debugPrint('$index');
                },
                itemBuilder: (BuildContext context, int index) {
                  return _cardSelector(index, _number);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Featured',
                    style: headlines,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 83,
                    child: FlatButton(
                      child: Text('Show all',
                          style: TextStyle(
                              fontSize: 13.5,
                              color: buttonColor,
                              fontFamily: 'PTsans',
                              fontWeight: FontWeight.w600)),
                      onPressed: () {
                        setState(() {});
                      },
                      color: Color(0xFFFAF5F3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Container(
              height: 220,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController2,
                itemCount: 3,
                onPageChanged: (int index) {},
                itemBuilder: (BuildContext context, int index) {
                  return _familySelector(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cardSelector(int index, int imageIn) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.62) + 0.09).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270,
            width: Curves.easeInOut.transform(value) * 320,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Center(
              child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0xFFE2E0E2),
                  blurRadius: 10.0,
                  offset: Offset(4.0, 3.0))
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagesSpecial[imageIn],
                width: 190,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          )),
          pageIndex == index
              ? Positioned(
                  right: 1,
                  bottom: 11,
                  child: FloatingActionButton(
                    onPressed: () {},
//              elevation: 2.7,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 23,
                    ),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              : Container(),
          pageIndex == index
              ? Positioned(
                  bottom: 1,
                  width: 200,
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Special Offer',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFD7D5D7),
                                  fontFamily: 'PTsans',
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  _familySelector(int index) {
    return AnimatedBuilder(
      animation: _pageController2,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController2.position.haveDimensions) {
          value = _pageController2.page - index;
          value = (1 - (value.abs() * 0.51) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 280,
            width: Curves.easeInOut.transform(value) * 300,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Center(
              child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0xFFE2E0E2),
                  blurRadius: 10.0,
                  offset: Offset(4.0, 3.0))
            ]),
            child: GridTile(
              footer: Material(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10))),
                clipBehavior: Clip.antiAlias,
                child: GridTileBar(
                  backgroundColor: Colors.black38,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          followFamily(index);
                        });
                      },
                      child: Text(
                        familyFollowed[index] ? 'Unfollow' : 'Follow',
                        style: TextStyle(fontFamily: 'PTSans', color: Colors.white70),
                      ),
                      color: Colors.white38,
//                    borderSide: BorderSide(color: Colors.white, width: 0.9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  title: Container(),
                  trailing: Icon( familyFollowed[index] ? Icons.star : Icons.star_border, color: Colors.white70,),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagesFamily[index],
                  width: 230,
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
