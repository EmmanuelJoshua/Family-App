import 'package:flutter/material.dart';
import 'package:familyapp/theme.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedindex = 0;
  int pageIndex = 1;

  PageController _pageController;

  final List<String> categories = [
    'Freebies',
    'Offers',
    'Contests',
    'Others'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              'Discover',
              style: headlines,
            ),
          ),
          backgroundColor: primaryColor,
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none),
                color: primaryText,
              ),
            ),
          ],
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 6),
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
                                        : primaryText,
                                    fontFamily: 'PTsans',
                                    fontWeight: FontWeight.w600)),
                            onPressed: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            color: selectedindex == index
                                ? Colors.red
                                : buttonHeader,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
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
                    return _cardSelector(index);
                  },
                ),
              ),
            ],
          ),
        ));
  }

  _cardSelector(int index) {
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
                'assets/images/food_salad.jpg',
                width: 190,
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          )),

          pageIndex == index ?
          Positioned(
            right: 1,
            bottom: 11,
            child: FloatingActionButton(
              onPressed: (){} ,
//              elevation: 2.7,
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ) : Container(),

          pageIndex == index ?
          Positioned(
            bottom: 1,
            width: 200,
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('Special Offer',
                        style: TextStyle(
                            fontSize: 14.5,
                            color: Color(0xFFD7D5D7),
                            fontFamily: 'PTsans',
                            fontWeight: FontWeight.w600)),
//                    Text('Share & Gain',
//                        style: TextStyle(
//                            fontSize: 16,
//                            color: Color(0xFF757575),
//                            fontFamily: 'PTsans',
//                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ): Container()
        ],
      ),
    );
  }
}
