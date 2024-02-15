import 'package:demo/Screen/HomePage.dart';
import 'package:demo/util/data.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List _pages;
  int _selectedPageIndex = 0;
  String title = '';
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 0) {
        title = 'Crop';
      } else if (_selectedPageIndex == 1) {
        title = 'Data';
      }
    });
  }

  void initState() {
    _pages = [
      HomePage(),
      Data(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        //unselectedFontSize: Colors.white,
        selectedItemColor: Colors.redAccent,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage_sharp),
            label: 'Data',
          )
        ],
      ),
    );
  }
}
