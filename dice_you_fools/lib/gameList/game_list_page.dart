import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_list_bloc.dart';
import 'game_list_form.dart';

class GameListPage extends StatefulWidget {

  GameListPage({Key key});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  GameListBloc _gameListBloc;

  @override
  void initState() {
    _gameListBloc = GameListBloc(
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      body: GameListForm(
        gameListBloc: _gameListBloc,
      ),
    );
  }

  @override
  void dispose() {
    _gameListBloc.dispose();
    super.dispose();
  }
}
