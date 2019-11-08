import 'package:dice_you_fools/signin/signin.dart';

import 'gameCreation/game_crea_page.dart';
import 'gameDisp/game_disp_page.dart';
import 'gameList/game_list_page.dart';
import 'userDisp/user_disp_page.dart';

final routes = {
  '/gameList': (context) => GameListPage(),
  '/gameCrea': (context) => GameCreaPage(),
  '/gameDisp': (context) => GameDispPage(),
  '/userDisp': (context) => UserDispPage()
};