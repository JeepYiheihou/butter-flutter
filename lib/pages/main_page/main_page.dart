import 'package:butter/common/global.dart';
import 'package:butter/models/user.dart';
import 'package:butter/pages/main_page/sub_pages/add_butter_page.dart';
import 'package:butter/utils/constants.dart';
import 'package:butter/pages/main_page/sub_pages/mine_page.dart';
import 'package:butter/pages/main_page/sub_pages/profile_page.dart';
import 'package:flutter/material.dart';

import 'sub_pages/butters_page.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  User? user;
  var scrollControllers = [
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
  ];

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
    var items = [
      generateNavBarItem(Icon(Icons.view_list), BUTTERS),
      generateNavBarItem(Icon(Icons.search), SEARCH),
      generateNavBarItem(Icon(Icons.add), NEW),
      generateNavBarItem(Icon(Icons.star), MINE),
      generateNavBarItem(Icon(Icons.person), PROFILE),
    ];

    setState(() {
      user = Global.user;
    });

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        selectedItemColor: MAIN_THEME_COLOR,
        unselectedItemColor: BUTTON_GREY_COLOR,
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
            scrollControllers[0],
          ),
          MinePage(
            scrollControllers[1],
          ),
          AddButterPage(
            scrollControllers[2],
          ),
          MinePage(
            scrollControllers[3],
          ),
          ProfilePage(
            scrollControllers[4],
          ),
        ],
      ),
    );
  }
}
