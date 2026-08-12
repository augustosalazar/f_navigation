import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home_tab.dart';
import '../widgets/profile_tab.dart';
import '../widgets/responsive_widget.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int _currentIndex = 0;
  late final String? _name;

  @override
  void initState() {
    super.initState();
    _name = Get.parameters['name'];
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomeTab(name: _name),
      ProfileTab(name: _name),
    ];

    final titles = <String>[
      'Welcome ${_name ?? ''}!',
      'Profile',
    ];

    return ResponsiveContainer(
      child: Scaffold(
        appBar: AppBar(
          key: const Key('page2AppBar'),
          title: Text(titles[_currentIndex]),
          actions: [
            IconButton(
              key: const Key('page2LogoutButton'),
              onPressed: () => Get.offNamed('/page1'),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: IndexedStack(
          key: const Key('page2Body'),
          index: _currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          key: const Key('page2BottomNavigation'),
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, key: Key('page2HomeTabButton')),
              activeIcon: Icon(Icons.home, key: Key('page2HomeTabButton')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, key: Key('page2ProfileTabButton')),
              activeIcon: Icon(Icons.person, key: Key('page2ProfileTabButton')),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
