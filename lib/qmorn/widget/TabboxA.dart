import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../colors.dart';

class TabboxA extends StatefulWidget {
  TabboxA({Key,key}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TapboxAState();
  }

}

class _TapboxAState extends State<TabboxA> {
  bool _active=false;

  void _handleTop(){
    setState(() {
      _active=!_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTop,
      child: new Container(
        child: new Center(
          child: new Text(_active?"active":"dead",
          style: new TextStyle(color: Colors.white, fontSize: 16.0),),
        ),
        width: 100,
        height: 100,
        decoration: new BoxDecoration(
          color: _active?Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}