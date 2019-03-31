import 'package:flutter/material.dart';

// create a stateful widget
class SelfStateTapBox extends StatefulWidget {
  @override
  _SelfTapBoxState createState() => _SelfTapBoxState();
}

// create a state which is hosted by SelfStateTapBox
class _SelfTapBoxState extends State<SelfStateTapBox> {
  /*
  tap to change background color
  when isActive is true, the color is green;
  isActive is false, the color is grey;
  tap to toggle isActive;
   */

  bool _isActive = false;
  void _handleTap() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _isActive ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.red[500]),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _isActive ? Colors.lightGreen[700] : Colors.grey[100],
        ),
      ),
    );
  }
}
