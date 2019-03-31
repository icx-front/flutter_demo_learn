import 'package:flutter/material.dart';
import 'Product.dart';
import 'Counter.dart';
import 'productList.dart';
import 'UserInterface/Detail.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40.0),
      decoration: BoxDecoration(color: Colors.blue[500]),

      // Row is a horizontal, linear layout
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: () {
              print(this);
            },
          ),
          // Expanded just like flexbox in css3
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      // Column is a vertical, linear layout
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text('我是谢尔听'),
                Counter(),
                ShoppingList(
                  products: <Product>[
                    Product(name: 'Eggs'),
                    Product(name: 'Flour'),
                    Product(name: 'Apple'),
                    Product(name: 'Airpods'),
                  ],
                )
              ],
            ),
          ),
          MyButton(),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped');
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(18.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Enage'),
        ),
      ),
    );
  }
}

Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      buildButtonColumn(Colors.green[600], Icons.call, 'CALL'),
      buildButtonColumn(Colors.green[600], Icons.navigation, 'ROUTE'),
      buildButtonColumn(Colors.green[600], Icons.share, 'SHARE'),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: Scaffold(
      appBar: AppBar(
        title: Text('User interface'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    ),
  ));
}
