import 'package:flutter/material.dart';
import 'package:flutter_qmorn/colors.dart';
import 'package:flutter_qmorn/qmorn/pages/LoginPage.dart';
import 'package:flutter_qmorn/qmorn/pages/LogoPage.dart';
import 'package:flutter_qmorn/qmorn/routers/router_page.dart';

import 'qmorn/pages/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterGank",
      theme: ThemeData(
        primarySwatch: mainColor,
        scaffoldBackgroundColor: Color(0xFFF7F7F7),
      ),
      routes: {
        router_page.login: (context) => new LoginPage(),
        router_page.main: (context) => new MainPage(),
      },
      home: LogoPage(),
    );
  }
}
