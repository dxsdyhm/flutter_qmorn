import 'package:flutter/material.dart';
import 'package:flutter_qmorn/colors.dart';
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
          image: new DecorationImage(
              image: AssetImage("assets/images/bg_elfdevice.png"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              Container(
                child: Image.asset("assets/images/ic_add.png"),
                alignment: Alignment.centerRight,
              ),
              Spacer(
                flex: 2,
              ),
              Image.asset("assets/images/ic_produck_name.png"),
              Spacer(
                flex: 6,
              ),
              Image.asset("assets/images/ic_dev_elf.png"),
              Spacer(
                flex: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset("assets/images/ic_elfset.png"),
                      Text(
                        "设备设置",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset("assets/images/ic_moniter.png"),
                      Text(
                        "远程陪护",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset("assets/images/ic_book_lib.png"),
                      Text(
                        "绘本书架",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              )
            ],
          ),
        ));
  }

  Widget _buildMine() {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            _buildUserInfo(),
            _buildFunction(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
        width: double.infinity,
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: mainColor
        ),
        child: Center(
          child: Column(children: <Widget>[
            Image.network(
              "https://q-links-com.oss-cn-shenzhen.aliyuncs.com/img/app/user/logo/1.jpg",
              width: 60,),
            Text("13128756863"),
          ],),
        ));
  }

  Widget _buildFunction() {
    return Container(child: Text("user"),);
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
