import 'package:flutter/material.dart';

import '../theme.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/signs.png',
            height: 100,
            width: 100,
          ),
          Padding(padding: EdgeInsets.all(10),),
          Text('Not Implemented', style: headlines)
        ],
      ),
    );
  }
}
