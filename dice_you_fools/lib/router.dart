import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gameCreation/game_crea_page.dart';
import 'gameDisp/game_disp_page.dart';
import 'gameList/game_list_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/gameList':
      return MaterialPageRoute(builder: (context) => GameListPage());
    case '/gameCrea':
      return MaterialPageRoute(builder: (context) => GameCreaPage());
    case '/gameDisp':
      return MaterialPageRoute(builder: (context) => GameDispPage());
    default:
      return MaterialPageRoute(builder: (context) => GameListPage());
  }
}