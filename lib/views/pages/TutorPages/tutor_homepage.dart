import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/TutorPages/tutor_homepage_view.dart';
import 'package:flutter_testing/views/pages/TutorPages/tutor_profile_page.dart';
import 'package:flutter_testing/views/pages/homepage_view.dart';
import 'package:flutter_testing/views/pages/inbox_view.dart';
import 'package:flutter_testing/views/pages/profile_page.dart';
import 'package:flutter_testing/views/pages/schedule_view.dart';

class TutorHomepage extends StatefulWidget {
  const TutorHomepage({
    super.key,
  });

  @override
  State<TutorHomepage> createState() => _TutorHomepageState();
}

class _TutorHomepageState extends State<TutorHomepage> {
  bool isDark = false;
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  List products = [
    {"id": 1, "name": "Guizhong", "image": "assets/images/guizhong.jpg"},
    {"id": 2, "name": "Guizhong", "image": "assets/images/guizhong.jpg"},
    {"id": 3, "name": "Guizhong", "image": "assets/images/guizhong.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return MaterialApp(
        theme: themeData,
        home: Scaffold(
          bottomNavigationBar: NavigationBar(
            labelBehavior: labelBehavior,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Colors.transparent,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.calendar_month),
                icon: Icon(Icons.calendar_month_outlined),
                label: 'Schedule',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.inbox),
                icon: Icon(Icons.inbox_outlined),
                label: 'Inbox',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.account_circle),
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profile',
              ),
            ],
          ),
          body: [
            /// Home page
            const TutorHomepageView(isNewAccount: true),

            /// Schedule page
            TableBasicsExample(),

            /// Inbox page
            const InboxView(),

            /// Profile page
            TutorProfilePage(),
          ][currentPageIndex],
        ));
  }
}
