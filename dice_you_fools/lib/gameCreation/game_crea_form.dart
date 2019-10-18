import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_crea_bloc.dart';
import 'game_crea_event.dart';
import 'game_crea_state.dart';


class GameCreaForm extends StatefulWidget {
  final GameCreaBloc gameCreaBloc;


  GameCreaForm({
    Key key,
    @required this.gameCreaBloc,
  }) : super(key: key);

  @override
  State<GameCreaForm> createState() => _GameCreaFormState();
}

class _GameCreaFormState extends State<GameCreaForm> {

  GameCreaBloc get _gameCreaBloc => widget.gameCreaBloc;
  
  final _games = List<String>.from(["Panic at Walmart", "Prosopopée", "Cthulhu"]);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<GameCreaEvent, GameCreaState>(
      bloc: _gameCreaBloc,
      builder: (
        BuildContext context,
        GameCreaState state,
      ) {
        return Form(
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: [
                Padding( // NAME
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 5,
                  ),
                  child: Text(
                    'Name your game',
                    style: TextStyle(
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding( // INPUT NAME
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 20,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder (
                        borderRadius:BorderRadius.circular(20.0)
                      ),
                      hintText: 'An epic story'
                    ),
                  ),
                ),
                Padding( // DESCRIPTION
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 5,
                  ),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding( // INPUT DESCRIPTION
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 20,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder (
                        borderRadius:BorderRadius.circular(20.0)
                      ),
                      hintText: 'Once upon a time ...'
                    ),
                  ),
                ),
                Container( // NOT SCHEDULED
                  width: MediaQuery.of(context).size.width - 48,
                  height: 90,
                  decoration: BoxDecoration( // Grey radius
                    color: Color.fromRGBO(196, 196, 196, 1),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding( // CALENDAR
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 0,
                          right: 0,
                          bottom: 0,
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/images/calendar.png"),
                          backgroundColor: Color.fromRGBO(255, 130, 52, 1),
                        ),
                      ),
                      Padding( // SELECT DATE
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 0,
                          right: 10,
                          bottom: 0,
                        ),
                        child: Text(
                          'Select your date',
                          style: TextStyle(
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}