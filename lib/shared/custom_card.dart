import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String _groupName;
  final String _groupDesc;

  const CustomCard(this._groupName, this._groupDesc);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: <Widget>[
          stackedCard(context),
          stackedThumbnail(),
        ],
      ),
    );
  }

  Container stackedThumbnail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: CircleAvatar(
        radius: 45.0,
        child: Icon(
          Icons.group,
          color: Colors.white,
        ),
      ),
    );
  }

  Container stackedCard(BuildContext context) {
    return Container(
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor, //Color(0xFF333366)
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: 4.0),
            Text(_groupName, style: Theme.of(context).textTheme.headline),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                height: 2.0,
                width: 18.0,
                color: Color(0xff00c6ff)),
            Container(height: 10.0),
            Text(_groupDesc, style: Theme.of(context).textTheme.title),
          ],
        ),
      ),
    );
  }
}
