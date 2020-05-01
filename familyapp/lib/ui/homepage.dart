import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Declaration of the top selection index
  int selectedindex = 0;
  //Declaration of the page index
  int pageIndex = 1;

  //Declaration of the two page controllers
  PageController _pageController;
  PageController _pageController2;

  //Declaration of top selection Button Color
  Color buttonColor = categoriesColor[0];

  //Declaration of the top selection list
  final List<String> categories = ['Freebies', 'Offers', 'Contests', 'Others'];

  //Declaration of boolean values for the family followed feature
  final List<bool> familyFollowed = [false, false, false];

  //Declaration of the images list for the special offers
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

  //Declaration of the images list for the featured families
  final List<String> imagesFamily = [
    'assets/images/baby.jpg',
    'assets/images/family.jpg',
    'assets/images/baby2.jpg',
  ];

  //implementation of the follow family feature
  void followFamily(int index){
    if(familyFollowed[index] == false) familyFollowed[index] = true;
    else if(familyFollowed[index] == true) familyFollowed[index] = false;
  }

  //Initialization of the Page Controllers
  @override
  void initState() {
    super.initState();
//    imageIndex = rand as int;
    _pageController = PageController(initialPage: 1, viewportFraction: 0.6);
    _pageController2 = PageController(initialPage: 1, viewportFraction: 0.6);
  }

  //Generation of a random number
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
    //Single Child Scrollview
    return SingleChildScrollView(

      //Sticky Header implementation
      child: StickyHeader(
        //Main header, cant be scrolled on
        header: Container(
          color: Colors.white,
          height: 56,
          padding: EdgeInsets.only(left: 6, bottom: 6),

          //Listview builder for the top selection buttons
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

        //Main Content
        content: Column(
          children: <Widget>[

            //Container for the first pageview / special offers
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

                  //the special offers card selector
                  return _cardSelector(index, _number);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),

            //Featured heading
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

            //Container for the second pageview / featured family
            Container(
              height: 220,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController2,
                itemCount: 3,
                onPageChanged: (int index) {},
                itemBuilder: (BuildContext context, int index) {

                  //the featured family card selector
                  return _familySelector(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //The special offers card selector implementation
  _cardSelector(int index, int imageIn) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {

        //reduced size of non selected card logic
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.62) + 0.09).clamp(0.0, 1.0);
        }

        //Logic for animation
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270,
            width: Curves.easeInOut.transform(value) * 320,
            child: widget,
          ),
        );
      },

      //Main special offers widgets
      child: Stack(
        children: <Widget>[

          //Main image parent
          Center(
              child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0xFFE2E0E2),
                  blurRadius: 10.0,
                  offset: Offset(4.0, 3.0))
            ]),

            //Image implementation
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

          //Floating Action Button Implementation
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

          //Bottom Text Implementation
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

  //The featured family card selector implementation
  _familySelector(int index) {
    return AnimatedBuilder(
      animation: _pageController2,
      builder: (BuildContext context, Widget widget) {

        //reduced size of non selected card logic
        double value = 1;
        if (_pageController2.position.haveDimensions) {
          value = _pageController2.page - index;
          value = (1 - (value.abs() * 0.51) + 0.06).clamp(0.0, 1.0);
        }
        //Animation logic
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 280,
            width: Curves.easeInOut.transform(value) * 300,
            child: widget,
          ),
        );
      },

      //Main featured family widget
      child: Stack(
        children: <Widget>[
          //Container with box shadow
          Center(
              child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0xFFE2E0E2),
                  blurRadius: 10.0,
                  offset: Offset(4.0, 3.0))
            ]),
            //Gridtile Implementation
            child: GridTile(
              footer: Material(
                color: Colors.transparent,

                //Rounded corner implementation
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10))),
                clipBehavior: Clip.antiAlias,
                child: GridTileBar(
                  backgroundColor: Colors.black38,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    //Follow button implemented with Flat button
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

              //Family Image implementation
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
