import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

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
    return Container(
      child: Text("音乐"),
    );
  }

  Widget _buildMine() {
    return Container(
      child: Text("我的"),
    );
  }

  Widget _buildDevice() {
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
