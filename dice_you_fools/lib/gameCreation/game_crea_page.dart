import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_crea_bloc.dart';
import 'game_crea_form.dart';

class GameCreaPage extends StatefulWidget {

  GameCreaPage({Key key});

  @override
  State<GameCreaPage> createState() => _GameCreaPageState();
}

class _GameCreaPageState extends State<GameCreaPage> {
  GameCreaBloc _gameCreaBloc;

  @override
  void initState() {
    _gameCreaBloc = GameCreaBloc(
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      body: GameCreaForm(
        gameCreaBloc: _gameCreaBloc,
      ),
    );
  }

  @override
  void dispose() {
    _gameCreaBloc.dispose();
    super.dispose();
  }
}
