import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:postit/utils/logout.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _bottomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'DashboardScreen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 30.0,
            ),
            tooltip: 'Log Out',
            onPressed: () => logout(context),
          )
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        tooltip: 'Create New Group',
        onPressed: () {
          print('pressed');
        },
      ),
    );
  }

  _buildBottomNavigationBar(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoTabBar(
        currentIndex: _bottomNavigationIndex,
        activeColor: Theme.of(context).primaryColor,
        onTap: setNavIndex,
        items: bottomNavBarItems(),
      );
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Theme.of(context).primaryColor,
      currentIndex: _bottomNavigationIndex,
      onTap: setNavIndex,
      items: bottomNavBarItems(),
    );
  }

  void setNavIndex(int index) {
    setState(() {
      _bottomNavigationIndex = index;
    });
  }

  List<BottomNavigationBarItem> bottomNavBarItems() {
    return [
      BottomNavigationBarItem(title: Text('Dashobard'), icon: Icon(Icons.home)),
      BottomNavigationBarItem(title: Text('Search'), icon: Icon(Icons.search))
    ];
  }
}
