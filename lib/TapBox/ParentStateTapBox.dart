import 'package:flutter/material.dart';

class ParentTapBox extends StatefulWidget {
  @override
  _ParentTapBoxState createState() => _ParentTapBoxState();
}

class _ParentTapBoxState extends State<StatefulWidget> {
  bool _isActive = false;

  void _handleTapboxChange(bool newValue) {
    setState(() {
      _isActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TapboxB(
      active: _isActive,
      onChanged: _handleTapboxChange,
    );
  }
}

class TapboxB extends StatelessWidget {
  // constructor func
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : "Inactive",
            style: TextStyle(color: Colors.red),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.green[100],
        ),
      ),
    );
  }
}
