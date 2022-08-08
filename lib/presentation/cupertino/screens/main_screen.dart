import 'package:flutter/cupertino.dart';
import 'package:vidis/presentation/cupertino/widgets/home.dart';
import 'package:vidis/presentation/cupertino/widgets/more.dart';
import 'package:vidis/presentation/cupertino/widgets/prescriptions_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list_fill),
            label: 'Prescriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ellipsis),
            label: 'More',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return const HomePage();
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return const PrescriptionsListPage();
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return const MorePage();
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
