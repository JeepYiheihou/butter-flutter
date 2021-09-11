import 'package:butter/common/global.dart';
import 'package:butter/models/user.dart';
import 'package:butter/utils/constants.dart';
import 'package:butter/pages/main_page/mine.dart';
import 'package:butter/pages/main_page/profile.dart';
import 'package:flutter/material.dart';

import 'butters.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  User? user;
  ScrollController buttersPageScrollController = ScrollController();
  ScrollController minePageScrollController = ScrollController();
  ScrollController profilePageScrollController = ScrollController();

  BottomNavigationBarItem generateNavBarItem(Icon icon, String label) {
    return BottomNavigationBarItem(icon: icon, label: label);
  }

  void scrollToTop(ScrollController scrollController) {
    scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
    );
  }
  @override
  Widget build(BuildContext context) {
    var scrollControllers = [
      buttersPageScrollController,
      minePageScrollController,
      profilePageScrollController,
    ];

    setState(() {
      user = Global.user;
    });

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          generateNavBarItem(Icon(Icons.view_list), BUTTERS),
          generateNavBarItem(Icon(Icons.star), MINE),
          generateNavBarItem(Icon(Icons.person), PROFILE),
        ],
        onTap: (int index) {

          // Current bottom bar works as scroller trigger to top.
          if (index == _currentIndex) {
            ScrollController scrollController = scrollControllers[index];
            scrollToTop(scrollController);
          }
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ButtersPage(
            buttersPageScrollController,
          ),
          MinePage(
            minePageScrollController,
          ),
          ProfilePage(
            profilePageScrollController,
          ),
        ],
      ),
    );
  }
}
