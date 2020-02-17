import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mb_app/utils/strings.dart';

class Gist extends StatelessWidget{
  String description,created_at;
  Gist({this.description,this.created_at});
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(

        padding: EdgeInsets.all(15.0),
        child: new Row(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(right: 12.0),
              child: new CircleAvatar(child: new Text(description[0].toUpperCase(),style: TextStyle(fontSize: 35.0),)),
              width: 60.0,
              height: 60.0,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  width: 250,
                  child:new Text(description,style: TextStyle(fontSize: 18.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 12,),
                ),
                new Text("${Strings.CREATED} : $created_at")
              ],
            )
          ],
        ),
      ),
    );
  }
}