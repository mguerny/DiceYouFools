import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_crea_bloc.dart';
import 'game_crea_event.dart';
import 'game_crea_state.dart';
import 'package:intl/intl.dart';


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
  
  final _players = List<String>.from(["Michoule F.", "Antoirne R.", "Plaul V."]);
  final nameController = TextEditingController();
  
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
                    controller: nameController,
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
                Container( // SELECT DATE
                  width: MediaQuery.of(context).size.width - 48,
                  height: 90,
                  decoration: BoxDecoration( // Grey radius
                    color: Color.fromRGBO(196, 196, 196, 1),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Row(
                    children: <Widget>[
                      GestureDetector( // TODAY
                        onTap: (){
                          print("Select Date clicked");
                          _selectDate(context);
                        },
                        child: Padding( // CALENDAR
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
                      ),
                      Padding( // SELECT DATE
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 0,
                          right: 10,
                          bottom: 0,
                        ),
                        child: Text(
                          new DateFormat.MMMMd().format(selectedDate),
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
                Padding( // PLAYERS TITLE + ADD
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
                        'Players',
                        style: TextStyle(
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector( // ADD PLAYER
                        onTap: (){
                          print("Add Player clicked");
                        },
                        child: CircleAvatar( // Plus image
                            backgroundImage: AssetImage("assets/images/plus.png"),
                            backgroundColor: Color.fromRGBO(31, 58, 147, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(  // PLAYER LIST
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
                      itemCount: _players.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final currentPlayer = _players[index];

                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(currentPlayer),
                          onDismissed: (direction) {
                            // Removes that item the list on swipwe
                            setState(() {
                              _players.removeAt(index);
                            });
                            // Shows the information on Snackbar
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text("$currentPlayer shall not participate")));
                          },
                          background: Container(color: Colors.red),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/game.png"),
                              backgroundColor: Color.fromRGBO(247, 202, 24, 1),
                            ),
                            title: Text(
                              currentPlayer,
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
                Padding( // CONFIRM
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 15,
                    right: 0,
                    bottom: 0,
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector( // CONFIRM
                        onTap: (){
                          print("Confirm game clicked");
                          Navigator.of(context).pop(nameController.text);
                        },
                        child: CircleAvatar( // Check image
                          radius: 25,
                          backgroundImage: AssetImage("assets/images/check.png"),
                          backgroundColor: Color.fromRGBO(38, 166, 91, 1),
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