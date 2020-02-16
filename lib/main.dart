import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mb_app/template/Card.dart';
import 'package:flutter_mb_app/utils/strings.dart';
import 'package:http/http.dart' as http;
void main() => runApp(Github());

class Github extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:Strings.APP_NAME,
      home: new GithubAPI(),
    );
  }
}
class GithubAPI extends StatefulWidget {
  @override
  State createState() => new GithubAPIState();
}

class GithubAPIState extends State<GithubAPI> with TickerProviderStateMixin {
  final List<ProfileCard> _card = <ProfileCard>[];
  final TextEditingController _textController = new TextEditingController();
  var resBody;
  bool searching =  false,api_no_limit = false;
  String user = null;
  Future _getUser(String text) async{
    setState(() {
      searching = true;
    });
    user = text;
    _textController.clear();
    String url = "https://api.github.com/users/"+text;
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      resBody = json.decode(res.body);
    });
    if(resBody['avatar_url'] !=  null) {
      ProfileCard card = new ProfileCard(
        user:user,
        text: resBody['name'],
        image: resBody['avatar_url'],
        public_repos: resBody['public_repos'],
        following: resBody['following'],
        followers:resBody['followers'],
        animationController: new AnimationController(
          duration: new Duration(milliseconds: 700),
          vsync: this,
        ),
      );
      setState(() {
        _card.insert(0, card);
      });
      print(_card.length);
      card.animationController.forward();
    }else{
      api_no_limit = true;
    }
    print("after id");
    searching = false;
  }

  void dispose() {
    for (ProfileCard message in _card)
      message.animationController.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _getUser,
                decoration:
                new InputDecoration.collapsed(hintText: "Enter Github Username"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.search),
                    onPressed: () => _getUser(_textController.text)
                )
            ),
          ]),
        )
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Github API"),
            elevation: 4.0
        ),
        body: new Container(
          child: new Column(
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor),
                  child: _buildTextComposer(),
                ),
                new Divider(height: 2.0),
                loading(),
                new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      itemBuilder: (_, int index) => _card[index],
                      itemCount: _card.length,
                    )
                ),
              ]
          ),
        )
    );
  }
  Widget loading(){
    if(searching){
      return new Container(
        height: 60.0,
        child:new Center(
            child:new CircularProgressIndicator()
        ),
      );
    }else if(api_no_limit) {
      return new Card(
        child: new Container(
            height: 80.0,
            color: Colors.red,
            child: new Center(
              child: new Text(
                "API LIMIT EXCEDED",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22.0
                ),
              ),
            )
        ),
      );
    }else{
      return new Container(

      );
    }
  }
}