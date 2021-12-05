import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:eco_rewards/src/constants/colors.dart';

import 'pages/explore_page.dart';
import 'pages/search_page.dart';
import 'pages/friends_page.dart';
import 'pages/account_page.dart';

class HomeScreen extends StatelessWidget {
  final _page = ValueNotifier<int>(0);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildPages(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      );

  // Use IndexedStack instead of PageView
  // to preserve the states of its children
  Widget _buildPages() => ValueListenableBuilder(
        valueListenable: _page,
        builder: (context, int page, _) => IndexedStack(
          index: page,
          children: const [
            ExplorePage(),
            SearchPage(),
            FriendsPage(),
            AccountPage(),
          ],
        ),
      );

  Widget _buildBottomNavigationBar() => SizedBox(
        height: 65.0,
        child: ValueListenableBuilder(
          valueListenable: _page,
          builder: (context, value, child) => BottomNavigationBar(
            currentIndex: _page.value,
            type: BottomNavigationBarType.fixed,
            elevation: 16.0,
            selectedItemColor: AppColors.primarySwatch.shade400,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            onTap: (index) => _page.value = index,
            items: [
              BottomNavigationBarItem(
                label: 'Explore',
                icon: Icon(
                    _page.value == 0 ? Ionicons.globe : Ionicons.globe_outline),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(_page.value == 1
                    ? Ionicons.search
                    : Ionicons.search_outline),
              ),
              BottomNavigationBarItem(
                label: 'Friends',
                icon: Icon(_page.value == 2
                    ? Ionicons.people
                    : Ionicons.people_outline),
              ),
              BottomNavigationBarItem(
                label: 'My Account',
                icon: Icon(_page.value == 3
                    ? Ionicons.person_circle
                    : Ionicons.person_circle_outline),
              ),
            ],
          ),
        ),
      );
}
