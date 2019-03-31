import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Text('Strawberry Pavlova'),
          ),
          Center(
            child:
                Text('fjdkljfkadjfkdsjfklj djfkadjfkdskl kfjaklfjdasfjsakdfjs'),
          ),
          Row(
            children: <Widget>[
              Text('Hello'),
              Text('170 Reviews'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.menu),
                  Text('PREP:'),
                  Text('25min'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.menu),
                  Text('PREP:'),
                  Text('25min'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.menu),
                  Text('PREP:'),
                  Text('25min'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
