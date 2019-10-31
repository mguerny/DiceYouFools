import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_disp_bloc.dart';
import 'game_disp_form.dart';

class GameDispPage extends StatefulWidget {

  GameDispPage({Key key});

  @override
  State<GameDispPage> createState() => _GameDispPageState();
}

class _GameDispPageState extends State<GameDispPage> {
  GameDispBloc _gameDispBloc;

  @override
  void initState() {
    _gameDispBloc = GameDispBloc(
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      body: GameDispForm(
        gameDispBloc: _gameDispBloc,
      ),
    );
  }

  @override
  void dispose() {
    _gameDispBloc.dispose();
    super.dispose();
  }
}
