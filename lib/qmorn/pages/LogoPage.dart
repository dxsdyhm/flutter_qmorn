import 'package:flutter/widgets.dart';
import 'package:flutter_qmorn/colors.dart';
import 'package:flutter_qmorn/qmorn/routers/router_page.dart';

class LogoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LogoPageState();
  }
}

class LogoPageState extends State<LogoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: mainColor,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/open_middle.png',
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    new Future.delayed(new Duration(seconds: 1),go2MainPage);
  }

  void go2MainPage() {
    Navigator.of(context).pushReplacementNamed(router_page.login);
  }
}
