import 'package:flutter/material.dart';

/*
to build a state widget, at least we need two class
one for create stateful widget and one for create the state
to the widget
 */

// LikeStar widget which use _LikeStarStat
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

// state host to LikeStar
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 41;

  _toggleFavirote() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount--;
      } else {
        _favoriteCount++;
      }
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavirote),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'jdffdsjdfsldfsfdsflj',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'kjdfsjklfdsfddfsl',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Column buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: color),
        ),
      ),
      FavoriteWidget(),
    ],
  );
}
