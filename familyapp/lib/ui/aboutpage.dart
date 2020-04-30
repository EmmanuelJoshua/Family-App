import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../theme.dart';

class AboutDeveloper extends StatefulWidget {
  @override
  _AboutDeveloperState createState() => _AboutDeveloperState();
}

class _AboutDeveloperState extends State<AboutDeveloper> {
  TabController _tabController;

  final List<String> experiences = [
    'Flutter Developer',
    'Lead Java Developer',
    'Senior Web Developer'
  ];

  final List<String> experiencesCompany = ['Google', 'Airbnb', 'Pinterest'];

  final List<String> experiencesIcons = [
    'assets/images/google.png',
    'assets/images/airbnb.png',
    'assets/images/pinterest.png'
  ];

  final List<String> experiencesDate = [
    'Sep 2019 - Present',
    'Jun 2017 - Apr 2019',
    'Jan 2016 - Mar 2017'
  ];

  final Map<String, Map<int, String>> reviews = {
    'reviewHeader': {
      0: 'Great mentor, thank you!',
      1: 'One of the best programmers',
      2: 'A good UI designer'
    },
    'reviewText': {
      0: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod',
      1: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod',
      2: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod'
    },
    'reviewer': {0: 'Caroline Bloome', 1: 'Mike Edward', 2: 'Serena Gomez'},
    'reviewerCareer': {0: 'Web Designer', 1: 'Java Developer', 2: 'UX Designer'}
  };

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: ScaffoldState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
              color: Color(0xFF1D2427),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    height: 246,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF1D2427),
                              blurRadius: 10.0,
                              offset: Offset(-9.0, -9.0))
                        ]),
                  ),
                  Center(
                      child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(15),
//                          boxShadow: [
//                            BoxShadow(
//                                color: Color(0xFF2B88A4),
//                                blurRadius: 10.0,
//                                offset: Offset(0.01,0.01))
//                          ]
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/developer.jpg',
                            width: 130,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(
                        'Emmanuel Joshua',
                        style: headlines,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                      ),
                      Text(
                        'Java - Android / Flutter Developer',
                        style: leadlines,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      SizedBox(
                        width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: ClipRect(
                                clipper: CircleClipper(),
                                child: Image.asset(
                                  'assets/images/facebook.png',
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: ClipRect(
                                clipper: CircleClipper(),
                                child: Image.asset(
                                  'assets/images/twitter.png',
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: ClipRect(
                                clipper: CircleClipper(),
                                child: Image.asset(
                                  'assets/images/envelope.png',
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1),
                      ),
                      TabBar(
                        controller: _tabController,
                        unselectedLabelColor: Colors.black26,
                        labelColor: Colors.black54,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.black54,
                        tabs: [
                          Tab(child: Text('Experience', style: tabheads)),
                          Tab(child: Text('Reviews(36)', style: tabheads)),
                        ],
                      ),
                    ],
                  )),
                ],
              )),
          Container(
            width: double.infinity,
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [
                new ExperienceWidget(
                    experiencesIcons: experiencesIcons,
                    experiences: experiences,
                    experiencesCompany: experiencesCompany,
                    experiencesDate: experiencesDate),
                Container(
                  color: Colors.transparent,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      itemBuilder: (BuildContext context, int index) {

                        if (index.isOdd) return new Divider();
                        
                        final position = index ~/ 2;

                        return Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 6, top: 8),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: 20, top: 10),
                                  child: Text(reviews['reviewHeader'][position],
                                      style: TextStyle(
                                          fontFamily: 'PTSans',
                                          fontSize: 16,
                                          color: primaryText,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(reviews['reviewText'][position],
                                      style: TextStyle(
                                          fontFamily: 'PTSans',
                                          fontSize: 16,
                                          color: primaryText,
                                          fontWeight: FontWeight.w400)),
                                ),
                                ListTile(
                                  leading:  Image.asset(
                                    'assets/images/user.png',
                                    height: 43,
                                    width: 43,
                                  ),
                                  title: Text(reviews['reviewer'][position],
                                      style: TextStyle(
                                          fontFamily: 'PTSans',
                                          fontSize: 16,
                                          color: primaryText,
                                          fontWeight: FontWeight.w600)),
                                  subtitle: Text(
                                      reviews['reviewerCareer'][position],
                                      style: TextStyle(
                                          fontFamily: 'PTSans',
                                          fontSize: 15,
                                          color: Color(0xFF9FB0AE),
                                          fontWeight: FontWeight.w600)),
                                  trailing: Image.asset(
                                    'assets/images/thumbs.png',
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                              ],
                            ));
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    Key key,
    @required this.experiencesIcons,
    @required this.experiences,
    @required this.experiencesCompany,
    @required this.experiencesDate,
  }) : super(key: key);

  final List<String> experiencesIcons;
  final List<String> experiences;
  final List<String> experiencesCompany;
  final List<String> experiencesDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 18, right: 18, bottom: 6, top: 8),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: ClipRect(
                  clipper: CircleClipper(),
                  child: Image.asset(
                    experiencesIcons[index],
                    height: 40,
                    width: 40,
                  ),
                ),
                title: Text(experiences[index],
                    style: TextStyle(
                        fontFamily: 'PTSans',
                        fontSize: 16,
                        color: primaryText,
                        fontWeight: FontWeight.w600)),
                subtitle: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(experiencesCompany[index],
                          style: TextStyle(
                              fontFamily: 'PTSans',
                              fontSize: 15,
                              color: Color(0xFF9FB0AE),
                              fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(experiencesDate[index],
                          style: TextStyle(
                              fontFamily: 'PTSans',
                              fontSize: 14,
                              color: Color(0xFFC2CDCC),
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return new Rect.fromCircle(
        center: new Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
