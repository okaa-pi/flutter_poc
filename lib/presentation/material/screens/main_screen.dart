import 'package:flutter/material.dart';
import 'package:vidis/presentation/material/widgets/home.dart';
import 'package:vidis/presentation/material/widgets/more.dart';
import 'package:vidis/presentation/material/widgets/prescriptions_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

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
              icon: Icon(Icons.list_alt),
              label: 'Prescriptions'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More'
          )
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
