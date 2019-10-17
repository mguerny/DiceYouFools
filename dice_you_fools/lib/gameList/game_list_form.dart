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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 20,
                  ),
                  child: Text(
                    'Schedule',
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.w500,
                        fontSize: 50.0,
                        color: Colors.black,
                      ),
                  ),
                ),
                Row( // Today - Not Scheduled
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container( // TODAY
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                  top: 5,
                                  right: 0,
                                  bottom: 0,
                                ),
                                child: CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/clock.png"),
                                    backgroundColor: Color.fromRGBO(38, 166, 91, 1),
                                ),
                              ),
                              Text("2"),
                            ],
                          ),
                          Text("Today"),
                        ],
                      ),
                    ),
                    Container( // NOT SCHEDULED
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                  top: 5,
                                  right: 0,
                                  bottom: 0,
                                ),
                                child: CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/calendar.png"),
                                  backgroundColor: Color.fromRGBO(255, 130, 52, 1),
                                ),
                              ),
                              Text("2"),
                            ],
                          ),
                          Text("Not Scheduled"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

}
