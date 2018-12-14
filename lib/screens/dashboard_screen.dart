import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:postit/utils/logout.dart';
import 'package:postit/shared/custom_card.dart';
import 'package:postit/utils/api.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _bottomNavigationIndex = 0;
  List<dynamic> _groups = [];

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  void _loadGroups() async {
    final api = Api();
    var response = await api.fetchUserGroups();
    if (response != null) {
      if (response['success']) {
        setState(() {
          _groups = response['groups'];
        });
      } else {
        // error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard',
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
      floatingActionButton: _buildFloatingActionButton(context),
      body: _dashboardScreenBody(),
    );
  }

  Widget _dashboardScreenBody() {
    return ListView.builder(
      itemCount: _groups.length,
      itemBuilder: (BuildContext context, int index) {
        var group = _groups[index]['group'];
        return CustomCard(group['name'], group['description']);
      },
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add),
      tooltip: 'Create New Group',
      onPressed: () {
        print('pressed');
      },
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
    });
  }

  List<BottomNavigationBarItem> bottomNavBarItems() {
    return [
      BottomNavigationBarItem(title: Text('Dashobard'), icon: Icon(Icons.home)),
      BottomNavigationBarItem(title: Text('Search'), icon: Icon(Icons.search))
    ];
  }
}
