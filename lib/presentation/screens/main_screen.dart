import 'package:flutter/material.dart';
import 'package:vidis/presentation/widgets/home.dart';
import 'package:vidis/presentation/widgets/more.dart';
import 'package:vidis/presentation/widgets/prescriptions_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  static const List<String> _titles = <String>[
    "Home",
    "Prescriptions",
    "More"
  ];
  int _selectedPage = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    PrescriptionsListPage(),
    MorePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedPage]),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Prescriptions'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'More'
          )
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: _onItemTapped,
      ),
    );
  }
}