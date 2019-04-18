import 'package:flutter/material.dart';

class QmxButton extends RaisedButton{
  const QmxButton({
    Key key,
    @required this.text,
    @required click,
  }):super(key:key,onPressed:click);
  final String text;
}