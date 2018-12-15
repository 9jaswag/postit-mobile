import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Map message;

  MessageCard(this.message);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.message, color: Colors.white),
            ),
            title: Text(
              message["title"],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Icon(Icons.linear_scale,
                    color: _priorityColor(message["priority"])),
                Text(" " + message["priority"],
                    style: TextStyle(color: Colors.white))
              ],
            ),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0)),
      ),
    );
  }

  _priorityColor(priority) {
    switch (priority) {
      case 'critical':
        return Colors.redAccent;
        break;
      case 'urgent':
        return Colors.yellowAccent;
        break;
      default:
        return Colors.greenAccent;
    }
  }
}
