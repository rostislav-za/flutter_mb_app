import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mb_app/model/Repository.dart';
import 'package:flutter_mb_app/utils/strings.dart';

class Repo extends StatelessWidget {
 // Repository r;
  String name, description, language;
  final int stargazers_count, forks_count, commits_count;

  Repo(this.name, this.description, this.stargazers_count, this.forks_count,
      this.language, this.commits_count) {
    if (this.description == null) {
      this.description = "No Description";
    }
    if (this.language == null) {
      this.language == "No Language";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.symmetric(vertical: 5.0,),
      child: new Wrap(
        direction: Axis.vertical, children: <Widget>[
          new Row(children: <Widget>[
            new Container(
              child: new CircleAvatar(child: new Text(
                name[0].toUpperCase(),
                style: TextStyle(fontSize: 42.0),
              )),
              width: 80.0,
              height: 80.0,
              margin: EdgeInsets.only(right: 10.0),
            ),

            new Container(
              width: 250,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    name,
                    style: TextStyle(fontSize: 20.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 12,
                  ),
                  new Text("${Strings.LANGUAGE} : $language"),
//                    new Text(description,maxLines: 12,),
                  new Text("${Strings.STAR} : $stargazers_count"),
                  new Text("${Strings.FORK} : $forks_count"),
                  new Text("${Strings.FORK} : $commits_count"),
                ],),),
          ],),
        new Container(
            width: 320,
            child: Text(  "${Strings.DESCRIBTION} : $description",
              overflow: TextOverflow.ellipsis,
              maxLines: 12,
            )),
            ],),));
  }
}
