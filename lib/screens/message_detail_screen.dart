import 'package:flutter/material.dart';

import 'package:postit/utils/priority_color.dart';

class MessageDetailScreen extends StatelessWidget {
  final Map message;

  MessageDetailScreen({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 1,
            valueColor:
                AlwaysStoppedAnimation(priorityColor(message['priority']))),
      ),
    );

    final topContentText =
        ListView(padding: const EdgeInsets.all(0.0), children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100.0),
          Icon(
            Icons.message,
            color: Colors.white,
            size: 40.0,
          ),
          Container(
            width: 90.0,
            child: Divider(color: priorityColor(message['priority'])),
          ),
          SizedBox(height: 10.0),
          Text(
            message['title'],
            style: TextStyle(color: Colors.white, fontSize: 45.0),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 1, child: levelIndicator),
              Expanded(
                  flex: 6,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        message['priority'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic),
                      ))),
            ],
          ),
        ],
      )
    ]);

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      message['message'],
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Theme.of(context).primaryColor,
          child: Text("MARK AS READ", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );
    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
