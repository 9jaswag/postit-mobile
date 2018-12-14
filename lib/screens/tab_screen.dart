import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dashboard_screen.dart';
import 'search_screen.dart';
import 'package:postit/utils/api.dart';
import 'package:postit/utils/local_storage.dart';
import 'login_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _bottomNavigationIndex = 0;
  List<dynamic> _groups = [];

  DashboardScreen pageOne;
  SearchScreen pageTwo;
  List<Widget> pages;
  Widget currentPgae;

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  void _loadGroups() async {
    final api = Api();
    Map response = await api.fetchUserGroups();
    if (response != null &&
        response.containsKey('success') &&
        response['success']) {
      setState(() {
        _groups = response['groups'];
      });
      _instantiatePages();
    } else {
      //error
      LocalStorage().deleteToken('userToken');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }
  }

  void _instantiatePages() {
    pageOne = DashboardScreen(
      groups: _groups,
    );
    pageTwo = SearchScreen();

    pages = [pageOne, pageTwo];
    currentPgae = pageOne;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPgae,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  _buildBottomNavigationBar(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoTabBar(
        currentIndex: _bottomNavigationIndex,
        activeColor: Theme.of(context).primaryColor,
        onTap: _setNavIndex,
        items: bottomNavBarItems(),
      );
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Theme.of(context).primaryColor,
      currentIndex: _bottomNavigationIndex,
      onTap: _setNavIndex,
      items: bottomNavBarItems(),
    );
  }

  void _setNavIndex(int index) {
    setState(() {
      _bottomNavigationIndex = index;
      currentPgae = pages[index];
    });
  }

  List<BottomNavigationBarItem> bottomNavBarItems() {
    return [
      BottomNavigationBarItem(title: Text('Dashobard'), icon: Icon(Icons.home)),
      BottomNavigationBarItem(title: Text('Search'), icon: Icon(Icons.search))
    ];
  }
}
