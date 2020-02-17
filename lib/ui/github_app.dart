import 'package:flutter/material.dart';

import 'package:flutter_mb_app/ui/screens/github_search_screen.dart';
import 'package:flutter_mb_app/utils/strings.dart';

class GithubApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:Strings.APP_NAME,
      home: new GitHubSearchScreen(),
    );
  }
}
