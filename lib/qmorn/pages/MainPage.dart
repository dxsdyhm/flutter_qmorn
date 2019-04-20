import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  final resUrl =
      "http://iot-ai.tuling123.com/jump/app/source?apiKey=1f9c927241a64082a5be9d967dbc5991&uid=1E5C8CD31396E355&client=android";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note), title: Text("音乐")),
          BottomNavigationBarItem(icon: Icon(Icons.devices), title: Text("设备")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("我的")),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
      body: _buidBody(),
    );
  }

  Widget _buidBody() {
    if (_selectedIndex == 0) {
      return _buildMusic();
    } else if (_selectedIndex == 1) {
      return _buildDevice();
    } else {
      return _buildMine();
    }
  }

  Widget _buildMusic() {
    return new SafeArea(
        child: new Scaffold(
      body: WebviewScaffold(
        url: resUrl,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ),
    ));
  }

  Widget _buildDevice() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image:new DecorationImage(image: AssetImage("assets/images/bg_elfdevice.png"),
        fit: BoxFit.cover),
      ),
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/ic_dev_elf.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset("assets/images/ic_elfset.png"),
              Image.asset("assets/images/ic_moniter.png"),
              Image.asset("assets/images/ic_book_lib.png"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMine() {
    return Container(
      child: Text("设备"),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
