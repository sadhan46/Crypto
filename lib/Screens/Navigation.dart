
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protto_assignment/Provider/MyCoinsProvider.dart';
import 'package:protto_assignment/Screens/Coin%20List.dart';
import 'package:protto_assignment/Screens/Home%20Page.dart';
import 'package:protto_assignment/Screens/My%20Portfolio.dart';
import 'package:provider/provider.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {


  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[

    HomePage(),
    CoinList(),
    HomePage(),
    CoinList(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pie_chart,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),

    );
  }
}
