import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:postit/utils/logout.dart';
import 'package:postit/shared/custom_card.dart';
import 'group_screen.dart';
import 'new_group_screen.dart';

class DashboardScreen extends StatelessWidget {
  final List<dynamic> groups;

  DashboardScreen({Key key, @required this.groups}): super(key: key);

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
      floatingActionButton: _buildFloatingActionButton(context),
      body: _dashboardScreenBody(),
    );
  }

  Widget _dashboardScreenBody() {
    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (BuildContext context, int index) {
        var group = groups[index]['group'];
        return GestureDetector(
            onTap: () => _navigateToGroup(context, group['id'], group['name']),
            child: CustomCard(
                groupName: group['name'],
                groupDesc: group['description'],
                unreadCount: groups[index]['unreadCount']));
      },
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColorDark,
      child: Icon(Icons.group_add),
      tooltip: 'Create New Group',
      onPressed: () => _navigateToCreateGroup(context),
    );
  }

  void _navigateToGroup(BuildContext context, int id, String name) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => GroupScreen(id: id, name: name)));
  }

  void _navigateToCreateGroup(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NewGroupScreen()));
  }
}
