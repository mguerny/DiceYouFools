import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_list_bloc.dart';
import 'game_list_event.dart';
import 'game_list_state.dart';


class GameListForm extends StatefulWidget {
  final GameListBloc gameListBloc;


  GameListForm({
    Key key,
    @required this.gameListBloc,
  }) : super(key: key);

  @override
  State<GameListForm> createState() => _GameListFormState();
}

class _GameListFormState extends State<GameListForm> {

  GameListBloc get _gameListBloc => widget.gameListBloc;
  
  final _games = List<String>.from(["Panic at Walmart", "Prosopopée", "Cthulhu"]);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<GameListEvent, GameListState>(
      bloc: _gameListBloc,
      builder: (
        BuildContext context,
        GameListState state,
      ) {
        return Form(
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: [
                Padding( // Schedule title
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 20,
                  ),
                  child: Text(
                    'Schedule',
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        color: Colors.black,
                      ),
                  ),
                ),
                Row( // TODAY - NOT SCHEDULED
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector( // TODAY
                      onTap: (){
                        print("Container clicked");
                      },
                      child: Container( // TODAY
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        height: 120,
                        decoration: BoxDecoration( // Grey radius
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                    top: 5,
                                    right: 0,
                                    bottom: 0,
                                  ),
                                  child: CircleAvatar( // Clock image
                                      backgroundImage: AssetImage("assets/images/clock.png"),
                                      backgroundColor: Color.fromRGBO(38, 166, 91, 1),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                    top: 5,
                                    right: 10,
                                    bottom: 0,
                                  ),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                        color: Colors.white,
                                      ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 0,
                                  right: 0,
                                  bottom: 10,
                                ),
                                child: Text(
                                  'Today',
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
                    ),
                    GestureDetector( // NOT SCHEDULED
                      onTap: (){
                        print("Container clicked");
                      },
                      child: Container( // NOT SCHEDULED
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        height: 120,
                        decoration: BoxDecoration( // Grey radius
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                    top: 5,
                                    right: 0,
                                    bottom: 0,
                                  ),
                                  child: CircleAvatar( // Clock image
                                      backgroundImage: AssetImage("assets/images/calendar.png"),
                                      backgroundColor: Color.fromRGBO(255, 130, 52, 1),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                    top: 5,
                                    right: 10,
                                    bottom: 0,
                                  ),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                        color: Colors.white,
                                      ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 0,
                                  right: 0,
                                  bottom: 10,
                                ),
                                child: Text(
                                  'Not scheduled',
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
                    ),
                  ],
                ),
                Padding( // MY GAMES TITLE + ADD
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 20,
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'My Games',
                        style: TextStyle(
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector( // TODAY
                        onTap: (){
                          print("Add Game clicked");
                        },
                        child: CircleAvatar( // Clock image
                            backgroundImage: AssetImage("assets/images/plus.png"),
                            backgroundColor: Color.fromRGBO(31, 58, 147, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(  // GAME LIST
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
                      itemCount: _games.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final currentGame = _games[index];

                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(currentGame),
                          onDismissed: (direction) {
                            // Removes that item the list on swipwe
                            setState(() {
                              _games.removeAt(index);
                            });
                            // Shows the information on Snackbar
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text("$currentGame dismissed")));
                          },
                          background: Container(color: Colors.red),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/game.png"),
                              backgroundColor: Color.fromRGBO(247, 202, 24, 1),
                            ),
                            title: Text(
                              currentGame,
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