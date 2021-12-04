import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:eco_rewards/src/constants/colors.dart';

import 'tabs/explore_tab.dart';
import 'tabs/search_tab.dart';
import 'tabs/friends_tab.dart';
import 'tabs/account_tab.dart';

class HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  final tabs = [
    ExploreTab(),
    const SearchTab(),
    const FriendsTab(),
    const AccountTab(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: tabs[_selectedTab],
        bottomNavigationBar: buildBottomNavigationBar(),
      );

  Widget buildBottomNavigationBar() => SizedBox(
        height: 65.0,
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          type: BottomNavigationBarType.fixed,
          elevation: 16.0,
          selectedItemColor: AppColors.primarySwatch.shade400,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          onTap: (index) => setState(() {
            _selectedTab = index;
          }),
          items: [
            BottomNavigationBarItem(
              label: "Explore",
              icon: Icon(
                  _selectedTab == 0 ? Ionicons.globe : Ionicons.globe_outline),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(_selectedTab == 1
                  ? Ionicons.search
                  : Ionicons.search_outline),
            ),
            BottomNavigationBarItem(
              label: "Friends",
              icon: Icon(_selectedTab == 2
                  ? Ionicons.people
                  : Ionicons.people_outline),
            ),
            BottomNavigationBarItem(
              label: "My Account",
              icon: Icon(_selectedTab == 3
                  ? Ionicons.person_circle
                  : Ionicons.person_circle_outline),
            ),
          ],
        ),
      );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}
