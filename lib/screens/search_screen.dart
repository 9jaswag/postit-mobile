import 'package:flutter/material.dart';

import 'package:postit/utils/api.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List _users = [];
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Search'),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          buildTop(context),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: inputController,
              decoration: InputDecoration(
                labelText: 'Enter username',
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () => _search(),
                color: Theme.of(context).primaryColor,
                child: Text("SEARCH", style: TextStyle(color: Colors.white)),
              ))
        ],
      ),
    );
  }

  Container buildTop(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      // padding: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _users.map((user) {
            return Chip(
              label: Text(user['username']),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _search() async {
    final api = Api();
    final response = await api.findUsers(username: inputController.text);
    if (response != null &&
        response.containsKey('success') &&
        response['success']) {
      setState(() {
        _users = response['users'];
      });
    }
  }
}
