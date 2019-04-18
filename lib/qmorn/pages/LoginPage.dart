import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qmorn/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginState();
  }
}

class LoginState extends State<LoginPage> {
  var _name = "";
  var _pwd = "";
  var _isSubmit = false;
  bool _name_foucs = false;
  bool _pwd_foucs = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        _layout(),
        _isSubmit
            ? IosLoadingWidget()
            : Container(
                color: Colors.transparent,
                height: 0.0,
              ),
      ],
    ));
  }

  Widget _layout() {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Padding(padding: new EdgeInsets.symmetric(vertical: 80.0)),
        new Padding(
          padding: new EdgeInsets.symmetric(vertical: 10.0),
          child: new SvgPicture.asset(
            'assets/images/svg/touming.svg',
            width: 80,
            height: 80,
            semanticsLabel: 'qmorn Logo',
          ),
        ),
        new Padding(
          padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 25.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Padding(
                  padding: new EdgeInsets.only(right: 10.0),
                  child: new Icon(
                    Icons.person,
                    size: 26,
                    color: _name_foucs ? mainColor : Colors.grey,
                  ),
                ),
                new Expanded(
                  child: new TextField(
                      decoration: new InputDecoration(
                        hintText: '请输入用户名',
                      ),
                      onChanged: (str) {
                        _name = str;
                      }),
                )
              ]),
        ),
        new Padding(
          padding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 36.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Padding(
                  padding: new EdgeInsets.only(right: 10.0),
                  child: new Icon(
                    Icons.lock,
                    size: 26,
                    color: _pwd_foucs ? mainColor : Colors.grey,
                  ),
                ),
                new Expanded(
                  child: new TextField(
                    decoration: new InputDecoration(
                      hintText: '请输入密码',
                    ),
                    onChanged: (str) {
                      _pwd = str;
                    },
                    obscureText: true,
                  ),
                )
              ]),
        ),
        new Container(
          width: 320.0,
          height: 44.0,
          child: new RaisedButton(
              onPressed: _login,
              color: mainColor,
              child: new Text(
                '登录',
                style: new TextStyle(color: Colors.white, fontSize: 16.0),
              )),
        ),
      ],
    );
  }

  void _login() {}

  void chengaPwdIcon() {
    setState(() {
      _pwd_foucs = true;
      _name_foucs = false;
    });
  }

  void chengaNameIcon() {
    setState(() {
      _pwd_foucs = false;
      _name_foucs = true;
    });
  }
}

class IosLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flex(
      mainAxisAlignment: MainAxisAlignment.center,
      direction: Axis.horizontal,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 262),
          child: new CupertinoActivityIndicator(
            radius: 14,
          ),
        ),
      ],
    );
  }
}
