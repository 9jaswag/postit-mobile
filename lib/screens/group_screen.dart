import 'package:flutter/material.dart';

import 'package:postit/utils/api.dart';
import 'package:postit/shared/message_card.dart';

class GroupScreen extends StatefulWidget {
  final int id;
  final String name;

  GroupScreen(this.id, this.name);

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  List<dynamic> _groupMessages = [];

  @override
  void initState() {
    super.initState();
    _loadGroupMessages();
  }

  void _loadGroupMessages() async {
    final api = Api();
    var response = await api.fetchGroupMessage(widget.id);

    if (response != null &&
        response.containsKey('success') &&
        response['success']) {
      setState(() {
        _groupMessages = response['message'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: ListView.builder(
        itemCount: _groupMessages.length,
        itemBuilder: (BuildContext context, int index) {
          return MessageCard(_groupMessages[index]);
        },
      ),
    );
  }
}
