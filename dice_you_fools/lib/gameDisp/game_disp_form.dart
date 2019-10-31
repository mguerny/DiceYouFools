import 'package:dice_you_fools/gameCreation/game_crea_page.dart';
import 'package:dice_you_fools/model/game.dart';
import 'package:dice_you_fools/model/user.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_disp_bloc.dart';
import 'game_disp_event.dart';
import 'game_disp_state.dart';


class GameDispForm extends StatefulWidget {
  final GameDispBloc gameDispBloc;


  GameDispForm({
    Key key,
    @required this.gameDispBloc,
  }) : super(key: key);

  @override
  State<GameDispForm> createState() => _GameDispFormState();
}

class _GameDispFormState extends State<GameDispForm> {

  GameDispBloc get _gameDispBloc => widget.gameDispBloc;

  @override
  Widget build(BuildContext context) {
    
    final Game game = ModalRoute.of(context).settings.arguments;
    print(game.users.length.toString());

    return BlocBuilder<GameDispEvent, GameDispState>(
      bloc: _gameDispBloc,
      builder: (
        BuildContext context,
        GameDispState state,
      ) {
        return Form(
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: [
                Padding( // GAME TITLE
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 20,
                  ),
                  child: Text(
                    game.name,
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        color: Colors.black,
                      ),
                  ),
                ),
                Padding( // GAME LOCATION
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 20,
                  ),
                  child: Text(
                    game.location,
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                  ),
                ),
                Row( // SCHEDULE
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 48,
                      height: 120,
                      decoration: BoxDecoration( // Grey radius
                        color: Color.fromRGBO(196, 196, 196, 1),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                  top: 15,
                                  right: 0,
                                  bottom: 0,
                                ),
                                child: CircleAvatar( // Calendar image
                                    backgroundImage: AssetImage("assets/images/calendar.png"),
                                    backgroundColor: Color.fromRGBO(255, 130, 52, 1),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 0,
                                right: 0,
                                bottom: 15,
                              ),
                              child: Text(
                                'GAME DATE',
                                style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding( // PLAYER LIST
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 20,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: BoxDecoration( // Grey radius
                      color: Color.fromRGBO(196, 196, 196, 1),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 0.5,
                          color: Color.fromRGBO(215, 215, 215, 1),
                        );
                      },
                      shrinkWrap: true,
                      itemCount: game.users.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        User currentPlayer = game.users[index];
                        print("player " + index.toString());
                        return new ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/game.png"),
                            backgroundColor: Color.fromRGBO(247, 202, 24, 1),
                          ),
                          title: Text(
                            currentPlayer.name,
                            style: TextStyle(
                              fontFamily: "Helvetica",
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          ),
                        );
                      }
                    )
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